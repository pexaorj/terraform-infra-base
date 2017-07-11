output "sg_nat_id" {
	value = "${aws_security_group.tf_df_infra_nat.id}"
}
output "sg_admin_id" {
        value = "${aws_security_group.tf_df_infra_access.id}"
}
output "sg_sql_admin_id" {
        value = "${aws_security_group.tf_df_infra_sql.id}"
}
