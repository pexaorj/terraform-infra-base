provider "aws" {
        region = "us-east-2"
        shared_credentials_file = ".config/credentials"
        profile                 = "your-profile-here"
}

terraform {
    backend "s3" {
    bucket = "your-s3-bucket-terraform"
    key    = "deploy-state/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "arch-state" {
    backend = "s3"
    config {
        bucket = "your-s3-bucket-terraform"
        key = "arch-state/terraform.tfstate"
        region = "us-east-1"
        shared_credentials_file = ".config/credentials"
        profile                 = "your-profile-here"
    }
}

module "subnets" {
    source = "./modules/subnets"
    vpc_id = "${data.terraform_remote_state.arch-state.vpc_id}"
    regiao = "${var.region}"
    cidrblockvpc = "${data.terraform_remote_state.arch-state.cidrblockvpc}"
    routetable_defaulta_id = "${data.terraform_remote_state.arch-state.route_default_a_id}"
    routetable_defaultc_id = "${data.terraform_remote_state.arch-state.route_default_c_id}"
}
module "app-instances" {
    source = "./modules/instances/app-instances"
    cidrblockvpc = "${data.terraform_remote_state.arch-state.cidrblockvpc}"
    sg_admin_id = "${data.terraform_remote_state.arch-state.sg_admin_id}"
    sg_monitoramento_zabbix_id = "${data.terraform_remote_state.arch-state.sg_monitoramento_zabbix_id}"
    subnet_app_a = "${module.subnets.subnet_app_a_id}"
    subnet_app_c = "${module.subnets.subnet_app_c_id}"
}
module "db-instances" {
    source = "./modules/instances/db-instances"
    cidrblockvpc = "${data.terraform_remote_state.arch-state.cidrblockvpc}"
    sg_admin_id = "${data.terraform_remote_state.arch-state.sg_admin_id}"
    sg_monit_zabbix_id = "${data.terraform_remote_state.arch-state.sg_monitoramento_zabbix_id}"
    sg_sql_admin_id = "${data.terraform_remote_state.arch-state.sg_sql_admin_id}"
    subnet_db_a = "${data.terraform_remote_state.arch-state.subnet_db_a_id}"
    subnet_db_c = "${data.terraform_remote_state.arch-state.subnet_db_c_id}"
}
