provider "aws" {
        region = "us-east-2"
        shared_credentials_file = ".config/credentials"
        profile                 = "your-profile-here"
}

terraform {
    backend "s3" {
    bucket = "your-s3-bucket-terraform"
    key    = "arch-state/terraform.tfstate"
    region = "us-east-1"
  }
}

module "env" {
    source = "./modules/env"
    project = "${var.project-name}"
}

module "eip" {
    source = "./modules/eip"
}

module "vpc" {
    source = "./modules/vpc"
    project = "${var.project-name}"
    cidrblockvpc = "${module.env.cidrblockip}"
    mainvpcassoc_routetabledefaultaid = "${module.routes.route_default_a_id}"
    region = "${var.region}"
}
module "routes" {
    source = "./modules/routes"
    project = "${var.project-name}"
    vpcid = "${module.vpc.vpcid}"
    nat-aid = "${module.arch-instances.instance_nat_a_id}"
    nat-cid = "${module.arch-instances.instance_nat_c_id}"
    region = "${var.region}"
}
module "subnets" {
    source = "./modules/subnets"
    vpcid = "${module.vpc.vpcid}"
    regiao = "${var.region}"
    project = "${var.project-name}"
    cidrblockvpc = "${module.env.cidrblockip}"
    base_block_a = "${module.vpc.base_block_a}"
    base_block_c = "${module.vpc.base_block_c}"
    routetable_dmz_id = "${module.routes.route_dmz_id}"
    routetable_defaulta_id = "${module.routes.route_default_a_id}"
    routetable_defaultc_id = "${module.routes.route_default_c_id}"
}
module "securitygroup_default" {
    source = "./modules/security-group"
    vpcid = "${module.vpc.vpcid}"
    vpccidr_block = "${module.env.cidrblockip}"
}
module "arch-instances" {
    source = "./modules/instances/arch-instances"
    project = "${var.project-name}"
    sg_nat_id = "${module.securitygroup_default.sg_nat_id}"
    sg_admin_id = "${module.securitygroup_default.sg_admin_id}"
    subnet_dmza = "${module.subnets.subnet_dmz_a_id}"
    subnet_dmzc = "${module.subnets.subnet_dmz_c_id}"
    eip_nat_a_id = "${module.eip.eip_nat_a_id}"
    eip_nat_c_id = "${module.eip.eip_nat_c_id}"
    cidrblockvpc = "${module.env.cidrblockip}"
}
