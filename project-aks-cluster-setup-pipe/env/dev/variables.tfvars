target_group_addition = true
appname = "ravicomp-com-v1"
devowner = "Ravi Sharma"
location="Central India"
resource_group_name="aks-rsg"
env = "dev"
container_registry_name="ravicompaksimage"
container_registry_resource_group_name="rg-tech-vnet"
kubernetes_version = "1.18.14"
admin_username = "azureuser"
system_agents_min_count = "5"
system_agents_max_count = "10"
system_agents_count = 5
system_agents_size = "Standard_D2_v2"
subnet_name1 = "private-subnet-1"
subnet_name2 = "private-subnet-2"
vnet_name   = "dev-vnet"
subnet_resource_group = "dev-RSG"
worker_agents_size = "Standard_D2_v2"
worker_agents_min_count = "5"
worker_agents_max_count = "40"
worker_agents_count = "10"
logs_ws_location = "Central India"
