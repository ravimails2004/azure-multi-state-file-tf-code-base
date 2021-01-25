module "loganalytics-ws" {
 source = "./src/terraform/modules/loganalytics-ws"
  env  = var.env
  location = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days
}

module "aks" {
 source = "./src/terraform/modules/aks"
  depends_on = [module.loganalytics-ws]
  resource_group_name = var.resource_group_name
  prefix  =  var.env
  aks_client_secret = var.aks_client_secret
  kubernetes_version = var.kubernetes_version
  admin_username = var.admin_username
  system_agents_min_count = var.system_agents_min_count
  system_agents_max_count = var.system_agents_max_count
  system_agents_count = var.system_agents_count
  system_agents_size = var.system_agents_size
  private_subnet_id = var.private_subnet_id
  log_analytics_workspace_id = module.loganalytics-ws.log_analytics_workspace_id
  worker_agents_size = var.worker_agents_size
  worker_agents_min_count =  var.worker_agents_min_count
  worker_agents_max_count = var.worker_agents_max_count
  worker_agents_count = var.worker_agents_count
  logs_ws_location = var.logs_ws_location
  log_analytics_workspace_name = module.loganalytics-ws.log_analytics_workspace_name
}