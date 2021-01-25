data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

#Get the subnetid details and assign it to vnet_subnet_id
data "azurerm_subnet" "private-subnet-1" {
  name                 = var.subnet_name1
  virtual_network_name = var.vnet_name
  resource_group_name  = var.subnet_resource_group
}

data "azurerm_subnet" "private-subnet-2" {
  name                 = var.subnet_name2
  virtual_network_name = var.vnet_name
  resource_group_name  = var.subnet_resource_group
}







module "ssh-key" {
  source         = "./modules/ssh-key"
  public_ssh_key = var.public_ssh_key == "" ? "" : var.public_ssh_key
}

resource "azuread_application" "aks" {
  name                       = "${var.prefix}-aks"
  available_to_other_tenants = true
  oauth2_allow_implicit_flow = true
}

resource "azuread_service_principal" "aks-sp" {
  application_id = azuread_application.aks.application_id
}

resource "azuread_service_principal_password" "aks-sp-pass" {
  service_principal_id = azuread_service_principal.aks-sp.id
  value                = var.aks_client_secret
  end_date             = "2999-01-01T01:02:03Z"
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "${var.prefix}-aks"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  node_resource_group = "${var.prefix}-nodegroup"
  dns_prefix          = var.prefix
  kubernetes_version  = var.kubernetes_version

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
    #load_balancer_profile {
    #  managed_outbound_ip_count=5
    #}
  }
  role_based_access_control {
    enabled = true
  }
  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      # remove any new lines using the replace interpolation function
      key_data = replace(var.public_ssh_key == "" ? module.ssh-key.public_ssh_key : var.public_ssh_key, "\n", "")
    }
  }

  service_principal {
    client_id     = azuread_application.aks.application_id
    client_secret = azuread_service_principal_password.aks-sp-pass.value
  }



  default_node_pool {
    name            = "systemnode"
    enable_auto_scaling = true
    type            = "VirtualMachineScaleSets"
    min_count       = var.system_agents_min_count
    max_count       = var.system_agents_max_count
    node_count      = var.system_agents_count
    vm_size         = var.system_agents_size
    os_disk_size_gb = 100
    vnet_subnet_id  = data.azurerm_subnet.private-subnet-1.id
    node_labels = {
      nodeType = "systemNode"
    }
    tags =  {
      name  = "${var.prefix}-system-node",
      owner = "DevOps"
    }
  }


  addon_profile  {

    http_application_routing {
      enabled = false
    }
    kube_dashboard {
      enabled = false
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
      }
  }

  tags = {
    Name    = "${var.prefix}-aks"
    Purpose = "AKS cluster for ${var.resource_group_name} tenant"
    Owner   = "DevOps"
  }

  #agent_pool_profile {}
  lifecycle {
    ignore_changes = [tags,]
    create_before_destroy = false
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks-cluster-np" {
  name                  = "workernode"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-cluster.id
  vm_size               = var.worker_agents_size
  enable_auto_scaling   = true
  min_count             = var.worker_agents_min_count
  max_count             = var.worker_agents_max_count
  node_count            = var.worker_agents_count
  vnet_subnet_id        = data.azurerm_subnet.private-subnet-2.id
  os_disk_size_gb = 100
  node_labels = {
    nodeType = "workerNode"
  }
  tags =  {
      Name  = "${var.prefix}-worker-node",
      owner = "DevOps"
    }
  lifecycle {
    ignore_changes = [tags,
   ]
  }
}

resource "azurerm_log_analytics_solution" "aks-log" {
  solution_name         = "ContainerInsights"
  location              = var.logs_ws_location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = var.log_analytics_workspace_id
  workspace_name        = var.log_analytics_workspace_name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
