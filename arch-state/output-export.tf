output "sg_admin_id" {
  value = "${module.securitygroup_default.sg_admin_id}"
}
output "sg_sql_admin_id" {
  value = "${module.securitygroup_default.sg_sql_admin_id}"
}
output "route_default_a_id" {
  value = "${module.routes.route_default_a_id}"
}
output "route_default_c_id" {
  value = "${module.routes.route_default_c_id}"
}
output "subnet_db_a_id" {
    value = "${module.subnets.subnet_db_a_id}"
}
output "subnet_db_c_id" {
    value = "${module.subnets.subnet_db_c_id}"
}
output "vpc_id" {
    value = "${module.vpc.vpcid}"
}
output "cidrblockvpc" {
    value = "${module.env.cidrblockip}"
}
output "instance_nat_a_id" {
        value = "${module.arch-instances.instance_nat_a_id}"
}
output "instance_nat_c_id" {
        value = "${module.arch-instances.instance_nat_c_id}"
}
output "eip_nat_a_id" {
  value = "${module.eip.eip_nat_a_id}"
}
output "eip_nat_c_id" {
  value = "${module.eip.eip_nat_c_id}"
}
