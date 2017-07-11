resource "aws_subnet" "db_a" {
    vpc_id = "${var.vpcid}"
    availability_zone = "${var.regiao}a"
    cidr_block = "${(cidrsubnet(var.base_block_a,4,1))}"
    tags {
        Name = "${var.project}-db-a"
    }
}
resource "aws_route_table_association" "db_a" {
    subnet_id = "${aws_subnet.db_a.id}"
    route_table_id = "${var.routetable_defaulta_id}"
}

resource "aws_subnet" "db_c" {
    vpc_id = "${var.vpcid}"
    availability_zone = "${var.regiao}c"
    cidr_block = "${(cidrsubnet(var.base_block_c,4,1))}"
    tags {
        Name = "${var.project}-db-c"
    }
}
resource "aws_route_table_association" "db_c" {
    subnet_id = "${aws_subnet.db_c.id}"
    route_table_id = "${var.routetable_defaultc_id}"
}
