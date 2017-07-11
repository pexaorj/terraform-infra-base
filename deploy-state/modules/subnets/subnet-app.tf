resource "aws_subnet" "subnet_app_a" {
    vpc_id = "${var.vpc_id}"
    availability_zone = "${var.regiao}a"
    #cidr_block = "${cidrsubnet(cidrsubnet(var.cidrblockvpc,1,0),4,2)}" #Caso o cidrblockvpc seja /23
    #cidr_block = "${cidrsubnet(cidrsubnet(var.cidrblockvpc,3,0),4,2)}" #Caso o cidrblockvpc seja /21
    cidr_block = "${cidrsubnet(cidrsubnet(var.cidrblockvpc,4,0),4,2)}" #Caso o cidrblockvpc seja /20
    tags {
        Name = "subnet_app_a"
    }
}
resource "aws_route_table_association" "app_a" {
    subnet_id = "${aws_subnet.subnet_app_a.id}"
    route_table_id = "${var.routetable_defaulta_id}"
}
resource "aws_subnet" "subnet_app_c" {
    vpc_id = "${var.vpc_id}"
    availability_zone = "${var.regiao}a"
    #cidr_block = "${cidrsubnet(cidrsubnet(var.cidrblockvpc,1,1),4,2)}" #Caso o cidrblockvpc seja /23
    #cidr_block = "${cidrsubnet(cidrsubnet(var.cidrblockvpc,3,1),4,2)}" #Caso o cidrblockvpc seja /21
    cidr_block = "${cidrsubnet(cidrsubnet(var.cidrblockvpc,4,1),4,2)}" #Caso o cidrblockvpc seja /20
   tags {
        Name = "subnet_app_c"
    }
}
resource "aws_route_table_association" "app_c" {
    subnet_id = "${aws_subnet.subnet_app_c.id}"
    route_table_id = "${var.routetable_defaultc_id}"
}
