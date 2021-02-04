module "resource-group" {
  source = "./src/terraform/modules/resource-group"
  target_group_addition = var.target_group_addition
  rsgname  =  var.resource_group_name
  location = var.location
  appname  = var.appname
  env      = var.env
  devowner = var.devowner
}


module "loganalytics-ws" {
 source = "./src/terraform/modules/loganalytics-ws"
  depends_on = [module.resource-group]
  env  = var.env
  location = var.location
  resource_group_name = module.resource-group.rsgname
}

module "aks" {
 source = "./src/terraform/modules/aks"
  depends_on = [module.loganalytics-ws]
  resource_group_name = var.resource_group_name
  prefix  =  var.env
  container_registry_name = var.container_registry_name
  container_registry_resource_group_name = var.container_registry_resource_group_name
  kubernetes_version = var.kubernetes_version
  admin_username = var.admin_username
  system_agents_min_count = var.system_agents_min_count
  system_agents_max_count = var.system_agents_max_count
  system_agents_count = var.system_agents_count
  system_agents_size = var.system_agents_size
  subnet_name1 = var.subnet_name1
  subnet_name2 = var.subnet_name2
  vnet_name         = var.vnet_name
  subnet_resource_group = var.subnet_resource_group
  log_analytics_workspace_id = module.loganalytics-ws.log_analytics_workspace_id
  worker_agents_size = var.worker_agents_size
  worker_agents_min_count =  var.worker_agents_min_count
  worker_agents_max_count = var.worker_agents_max_count
  worker_agents_count = var.worker_agents_count
  logs_ws_location = var.logs_ws_location
  log_analytics_workspace_name = module.loganalytics-ws.log_analytics_workspace_name
}
