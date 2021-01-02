Terraform Cloud Automation
==========================

Description
-------------
This README file help you to deploy cloud workload via 100% automation, terraform is a solution,
which provision all the cloud infra like network, vnet, subnets, VM's aks, etc whatever you can,
think for a given project in terms of infra automation

Project Structure
------------------
```python
├── backend.tf : File records the terraform state file
├── env  : Structure can manage multiple environments      
│ └── dev : For dev env, we can have as many env's as we want
|    └── variables.tfvars : file manages the variables dynamically at environment level.
├── main.tf : This is the main file which includes all the modules and variables can be associated at various level
├── src : Source dir for source code management
│    └── terraform : All the terraform related code base will exist here.
│         └── modules : All the terraform modules will exist here.
│               ├── resource-group : This is the resource group modules, responsible for creation, and data lookup on,
|               |   an, exisiting resource group. 
│               |      ├── main.tf : This is the main file where resource creation and data lookup code is available.
│               |      ├── outputs.tf : This is the code which will basically output the variables after data lookup.
│               |      └── variables.tf : Variable declaration for local module level
│               └── vnet : This is the main vnet module which creates all the vnet specific resources.
|                     ├── main.tf : This is the file where all the resource + data lookup happens.
|                     ├── outputs.tf : This is the code which will basically output the variables after data lookup.
│                     └── variables.tf : Variable declaration for local module level
|
| - variables.tf : Variable declaration at project level
```


Variables
----------
```python
name type = str This basically defines the environment name.
location type = str This basically defines the location name.
rsgname type = str This basically defines the resource group name.
public_subnet_cidr   type = list This basically defines the Public subnet cidr ranges.
private_subnet_cidr   type = list This basically defines the Private subnet cidr ranges.
address_space  type = list This basically defines the address space ranges.
```




Example
-------------------------
How to use this project
-------------------------
```python
1) git clone https://Ravisri@bitbucket.org/microservicesembibe/terraform-code-base.git

2) cd terraform-code-base 

3) run these commands and create soft link

ln -s /home/ubuntu/13/git-repo/terraform-code-base/modules /home/ubuntu/13/git-repo/terraform-code-base/vnet-design-dev/src/terraform/modules
ls -l vnet-design-dev/src/terraform/
total 0
lrwxrwxrwx 1 ubuntu ubuntu 52 Dec 31 12:26 modules -> /home/ubuntu/13/git-repo/terraform-code-base/modules

4) Navigate and run terraform (We are using terraform 0.13)

source arm.sh    (Not commited to repo please contact me for this it contains)

cat  arm.sh 
export ARM_CLIENT_ID="XXXXXX-XXXXXX-XXXXXXX-XXXXXXX"
export ARM_CLIENT_SECRET="XXXXXX-XXXXXX-XXXXXXX-XXXXXXX"
export ARM_SUBSCRIPTION_ID="XXXXXX-XXXXXX-XXXXXXX-XXXXXXX"
export ARM_TENANT_ID="XXXXXX-XXXXXX-XXXXXXX-XXXXXXX"
export ARM_ACCESS_KEY="XXXXXX-XXXXXX-XXXXXXX-XXXXXXX=="


5) Running terraform 
cd vnet-design-dev
terraform init
terraform plan -var-file="env/dev/variables.tfvars"
terraform apply  -var-file=env/dev/variables.tfvars -auto-approve
```

Output
--------------

```python
ubuntu@tech-fiber-jenkins-prod-02:~/13/tf-code$ terraform-13 apply  -var-file="env/dev/variables.tfvars"
module.resource-group.data.azurerm_resource_group.resource-group: Refreshing state...

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.vnet.azurerm_nat_gateway.nat-gw[0] will be created
  + resource "azurerm_nat_gateway" "nat-gw" {
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + location                = "centralindia"
      + name                    = "nat-gw-1"
      + public_ip_address_ids   = (known after apply)
      + public_ip_prefix_ids    = (known after apply)
      + resource_group_name     = "dev-RSG"
      + resource_guid           = (known after apply)
      + sku_name                = "Standard"
    }

  # module.vnet.azurerm_nat_gateway.nat-gw[1] will be created
  + resource "azurerm_nat_gateway" "nat-gw" {
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + location                = "centralindia"
      + name                    = "nat-gw-2"
      + public_ip_address_ids   = (known after apply)
      + public_ip_prefix_ids    = (known after apply)
      + resource_group_name     = "dev-RSG"
      + resource_guid           = (known after apply)
      + sku_name                = "Standard"
    }

  # module.vnet.azurerm_nat_gateway.nat-gw[2] will be created
  + resource "azurerm_nat_gateway" "nat-gw" {
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + location                = "centralindia"
      + name                    = "nat-gw-3"
      + public_ip_address_ids   = (known after apply)
      + public_ip_prefix_ids    = (known after apply)
      + resource_group_name     = "dev-RSG"
      + resource_guid           = (known after apply)
      + sku_name                = "Standard"
    }

  # module.vnet.azurerm_network_security_group.private-subnet-nsg[0] will be created
  + resource "azurerm_network_security_group" "private-subnet-nsg" {
      + id                  = (known after apply)
      + location            = "centralindia"
      + name                = "private-subnet-nsg-1"
      + resource_group_name = "dev-RSG"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "allow-all"
              + priority                                   = 100
              + protocol                                   = "*"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "Name"    = "private-subnet-nsg-1"
          + "Owner"   = "DevOps"
          + "Purpose" = "NSG for private subnet of dev-vnet vnet"
        }
    }

  # module.vnet.azurerm_network_security_group.private-subnet-nsg[1] will be created
  + resource "azurerm_network_security_group" "private-subnet-nsg" {
      + id                  = (known after apply)
      + location            = "centralindia"
      + name                = "private-subnet-nsg-2"
      + resource_group_name = "dev-RSG"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "allow-all"
              + priority                                   = 100
              + protocol                                   = "*"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "Name"    = "private-subnet-nsg-2"
          + "Owner"   = "DevOps"
          + "Purpose" = "NSG for private subnet of dev-vnet vnet"
        }
    }

  # module.vnet.azurerm_network_security_group.private-subnet-nsg[2] will be created
  + resource "azurerm_network_security_group" "private-subnet-nsg" {
      + id                  = (known after apply)
      + location            = "centralindia"
      + name                = "private-subnet-nsg-3"
      + resource_group_name = "dev-RSG"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "allow-all"
              + priority                                   = 100
              + protocol                                   = "*"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "Name"    = "private-subnet-nsg-3"
          + "Owner"   = "DevOps"
          + "Purpose" = "NSG for private subnet of dev-vnet vnet"
        }
    }

  # module.vnet.azurerm_network_security_group.public-subnet-nsg will be created
  + resource "azurerm_network_security_group" "public-subnet-nsg" {
      + id                  = (known after apply)
      + location            = "centralindia"
      + name                = "public-subnet-nsg"
      + resource_group_name = "dev-RSG"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "allow-all"
              + priority                                   = 100
              + protocol                                   = "*"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "Name"    = "public-subnet-nsg"
          + "Owner"   = "DevOps"
          + "Purpose" = "NSG for public subnet of dev-vnet vnet"
        }
    }

  # module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[0] will be created
  + resource "azurerm_public_ip_prefix" "nat-gw-pip-prefix" {
      + id                  = (known after apply)
      + ip_prefix           = (known after apply)
      + location            = "centralindia"
      + name                = "pip-prefix-nat-gw-1"
      + prefix_length       = 30
      + resource_group_name = "dev-RSG"
      + sku                 = "Standard"
    }

  # module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[1] will be created
  + resource "azurerm_public_ip_prefix" "nat-gw-pip-prefix" {
      + id                  = (known after apply)
      + ip_prefix           = (known after apply)
      + location            = "centralindia"
      + name                = "pip-prefix-nat-gw-2"
      + prefix_length       = 30
      + resource_group_name = "dev-RSG"
      + sku                 = "Standard"
    }

  # module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[2] will be created
  + resource "azurerm_public_ip_prefix" "nat-gw-pip-prefix" {
      + id                  = (known after apply)
      + ip_prefix           = (known after apply)
      + location            = "centralindia"
      + name                = "pip-prefix-nat-gw-3"
      + prefix_length       = 30
      + resource_group_name = "dev-RSG"
      + sku                 = "Standard"
    }

  # module.vnet.azurerm_subnet.private-subnet[0] will be created
  + resource "azurerm_subnet" "private-subnet" {
      + address_prefix                                 = "192.168.32.0/19"
      + address_prefixes                               = (known after apply)
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "private-subnet-1"
      + resource_group_name                            = "dev-RSG"
      + service_endpoints                              = [
          + "Microsoft.Sql",
        ]
      + virtual_network_name                           = "dev-vnet"
    }

  # module.vnet.azurerm_subnet.private-subnet[1] will be created
  + resource "azurerm_subnet" "private-subnet" {
      + address_prefix                                 = "192.168.64.0/19"
      + address_prefixes                               = (known after apply)
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "private-subnet-2"
      + resource_group_name                            = "dev-RSG"
      + service_endpoints                              = [
          + "Microsoft.Sql",
        ]
      + virtual_network_name                           = "dev-vnet"
    }

  # module.vnet.azurerm_subnet.private-subnet[2] will be created
  + resource "azurerm_subnet" "private-subnet" {
      + address_prefix                                 = "192.168.96.0/19"
      + address_prefixes                               = (known after apply)
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "private-subnet-3"
      + resource_group_name                            = "dev-RSG"
      + service_endpoints                              = [
          + "Microsoft.Sql",
        ]
      + virtual_network_name                           = "dev-vnet"
    }

  # module.vnet.azurerm_subnet.public-subnet[0] will be created
  + resource "azurerm_subnet" "public-subnet" {
      + address_prefix                                 = "192.168.0.0/19"
      + address_prefixes                               = (known after apply)
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "public-subnet-1"
      + resource_group_name                            = "dev-RSG"
      + service_endpoints                              = []
      + virtual_network_name                           = "dev-vnet"
    }

  # module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[0] will be created
  + resource "azurerm_subnet_nat_gateway_association" "nat-subnet-assoc" {
      + id             = (known after apply)
      + nat_gateway_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[1] will be created
  + resource "azurerm_subnet_nat_gateway_association" "nat-subnet-assoc" {
      + id             = (known after apply)
      + nat_gateway_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[2] will be created
  + resource "azurerm_subnet_nat_gateway_association" "nat-subnet-assoc" {
      + id             = (known after apply)
      + nat_gateway_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[0] will be created
  + resource "azurerm_subnet_network_security_group_association" "private-subnet-association" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[1] will be created
  + resource "azurerm_subnet_network_security_group_association" "private-subnet-association" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[2] will be created
  + resource "azurerm_subnet_network_security_group_association" "private-subnet-association" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # module.vnet.azurerm_subnet_network_security_group_association.public-subnet-association[0] will be created
  + resource "azurerm_subnet_network_security_group_association" "public-subnet-association" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # module.vnet.azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space         = [
          + "192.168.0.0/16",
        ]
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "centralindia"
      + name                  = "dev-vnet"
      + resource_group_name   = "dev-RSG"
      + subnet                = (known after apply)
      + tags                  = {
          + "Name"    = "dev-vnet"
          + "Owner"   = "DevOps"
          + "Purpose" = "Vnet for dev-RSG"
        }
      + vm_protection_enabled = false
    }

Plan: 22 to add, 0 to change, 0 to destroy.


Warning: "address_prefix": [DEPRECATED] Use the `address_prefixes` property instead.

  on src/terraform/modules/vnet/main.tf line 14, in resource "azurerm_subnet" "public-subnet":
  14: resource "azurerm_subnet" "public-subnet" {

(and one more similar warning elsewhere)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.vnet.azurerm_virtual_network.vnet: Creating...
module.vnet.azurerm_network_security_group.private-subnet-nsg[2]: Creating...
module.vnet.azurerm_network_security_group.private-subnet-nsg[1]: Creating...
module.vnet.azurerm_network_security_group.public-subnet-nsg: Creating...
module.vnet.azurerm_network_security_group.private-subnet-nsg[0]: Creating...
module.vnet.azurerm_virtual_network.vnet: Creation complete after 5s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet]
module.vnet.azurerm_subnet.public-subnet[0]: Creating...
module.vnet.azurerm_subnet.private-subnet[0]: Creating...
module.vnet.azurerm_subnet.private-subnet[1]: Creating...
module.vnet.azurerm_subnet.private-subnet[2]: Creating...
module.vnet.azurerm_network_security_group.private-subnet-nsg[1]: Creation complete after 5s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/networkSecurityGroups/private-subnet-nsg-2]
module.vnet.azurerm_network_security_group.public-subnet-nsg: Creation complete after 5s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/networkSecurityGroups/public-subnet-nsg]
module.vnet.azurerm_network_security_group.private-subnet-nsg[2]: Creation complete after 5s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/networkSecurityGroups/private-subnet-nsg-3]
module.vnet.azurerm_network_security_group.private-subnet-nsg[0]: Creation complete after 5s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/networkSecurityGroups/private-subnet-nsg-1]
module.vnet.azurerm_subnet.private-subnet[1]: Creation complete after 4s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-2]
module.vnet.azurerm_subnet.public-subnet[0]: Creation complete after 7s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/public-subnet-1]
module.vnet.azurerm_subnet_network_security_group_association.public-subnet-association[0]: Creating...
module.vnet.azurerm_subnet.private-subnet[0]: Still creating... [10s elapsed]
module.vnet.azurerm_subnet.private-subnet[2]: Still creating... [10s elapsed]
module.vnet.azurerm_subnet.private-subnet[0]: Creation complete after 10s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-1]
module.vnet.azurerm_subnet.private-subnet[2]: Creation complete after 14s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-3]
module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[2]: Creating...
module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[1]: Creating...
module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[0]: Creating...
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[1]: Creating...
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[0]: Creating...
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[2]: Creating...
module.vnet.azurerm_subnet_network_security_group_association.public-subnet-association[0]: Still creating... [10s elapsed]
module.vnet.azurerm_subnet_network_security_group_association.public-subnet-association[0]: Creation complete after 10s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/public-subnet-1]
module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[0]: Creation complete after 4s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/publicIPPrefixes/pip-prefix-nat-gw-1]
module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[2]: Creation complete after 4s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/publicIPPrefixes/pip-prefix-nat-gw-3]
module.vnet.azurerm_public_ip_prefix.nat-gw-pip-prefix[1]: Creation complete after 4s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/publicIPPrefixes/pip-prefix-nat-gw-2]
module.vnet.azurerm_nat_gateway.nat-gw[1]: Creating...
module.vnet.azurerm_nat_gateway.nat-gw[0]: Creating...
module.vnet.azurerm_nat_gateway.nat-gw[2]: Creating...
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[1]: Creation complete after 6s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-2]
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[0]: Still creating... [10s elapsed]
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[2]: Still creating... [10s elapsed]
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[0]: Creation complete after 10s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-1]
module.vnet.azurerm_subnet_network_security_group_association.private-subnet-association[2]: Creation complete after 13s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-3]
module.vnet.azurerm_nat_gateway.nat-gw[1]: Still creating... [10s elapsed]
module.vnet.azurerm_nat_gateway.nat-gw[0]: Still creating... [10s elapsed]
module.vnet.azurerm_nat_gateway.nat-gw[2]: Still creating... [10s elapsed]
module.vnet.azurerm_nat_gateway.nat-gw[2]: Creation complete after 11s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/natGateways/nat-gw-3]
module.vnet.azurerm_nat_gateway.nat-gw[0]: Creation complete after 11s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/natGateways/nat-gw-1]
module.vnet.azurerm_nat_gateway.nat-gw[1]: Creation complete after 11s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/natGateways/nat-gw-2]
module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[1]: Creating...
module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[0]: Creating...
module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[2]: Creating...
module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[0]: Creation complete after 3s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-1]
module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[1]: Creation complete after 7s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-2]
module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[2]: Still creating... [10s elapsed]
module.vnet.azurerm_subnet_nat_gateway_association.nat-subnet-assoc[2]: Creation complete after 10s [id=/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/dev-RSG/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/private-subnet-3]

Apply complete! Resources: 22 added, 0 changed, 0 destroyed.
```
Author
------
Ravi P Srivastav
