output "Server_details" {
  depends_on = [
    module.instance
  ]
  value = module.instance.heavy_detail

}

output "vpc_details" {
  depends_on = [
    module.instance
  ]
  value = [{
    vpc_id                                = module.vpc_remote.vpc_id
    default_vpc_id                        = module.vpc_remote.default_vpc_id
    igw_id                                = module.vpc_remote.igw_id
    default_network_acl_id                = module.vpc_remote.default_network_acl_id
    default_vpc_default_network_acl_id    = module.vpc_remote.default_vpc_default_network_acl_id
    default_route_table_id                = module.vpc_remote.default_route_table_id
    default_vpc_default_route_table_id    = module.vpc_remote.default_vpc_default_route_table_id
    default_security_group_id             = module.vpc_remote.default_security_group_id
    default_vpc_default_security_group_id = module.vpc_remote.default_vpc_default_security_group_id
    default_vpc_arn                       = module.vpc_remote.default_vpc_arn
    default_vpc_cidr_block                = module.vpc_remote.default_vpc_cidr_block

    public_internet_gateway_route_id = module.vpc_remote.public_internet_gateway_route_id
    public_network_acl_id            = module.vpc_remote.public_network_acl_id
    public_route_table_ids           = module.vpc_remote.public_route_table_ids
    public_subnets                   = module.vpc_remote.public_subnets
    public_subnets_cidr_blocks       = module.vpc_remote.public_subnets_cidr_blocks[*]












  }]
}