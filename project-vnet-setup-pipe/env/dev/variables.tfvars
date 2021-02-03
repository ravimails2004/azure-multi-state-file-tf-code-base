rsgname = "dev-RSG"
vnet-name = "dev-vnet"
name = "dev"
location = "Central India"
address_space = ["192.168.0.0/16"]
private_subnet_cidr = ["192.168.32.0/19", "192.168.64.0/19","192.168.96.0/19"]
public_subnet_cidr = ["192.168.0.0/19"]
target_group_addition = "false"
vnet_dest_resource_group_names = ["rg-tech-vnet", "rg-vnet-dsl", "rg-tech-vnet", "rg-tech-vnet", "rg-tech-vnet", "rg-tech-vnet", "rg-hadoop-presto-cluster", "rg-tech-vnet", "rg-tech-vnet", "rg-tech-vnet", "rg-tech-vnet" ]
vnet_dest_ids = ["/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/private-dns-tech", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-vnet-dsl/providers/Microsoft.Network/virtualNetworks/dsl-vnet", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/tech-useast-vnet", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/rg-tech-vnet-vnet", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/private-dns-westindia", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/private-dns-west-india-new", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/VirtualNetwork", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/private-dns-west-india-02", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/fiber_ms_vnet", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/ANF-VNET", "/subscriptions/435eb2d9-454e-43d7-bef5-36be114edbb4/resourceGroups/rg-tech-vnet/providers/Microsoft.Network/virtualNetworks/staging-vnet"]
vnet_dest_names = ["private-dns-tech", "dsl-vnet", "tech-useast-vnet", "rg-tech-vnet-vnet", "private-dns-westindia", "private-dns-west-india-new", "VirtualNetwork", "private-dns-west-india-02", "fiber_ms_vnet", "ANF-VNET", "staging-vnet"]

