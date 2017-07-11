resource "aws_vpc_dhcp_options" "dhcp-options" {
    domain_name = "${var.region}.compute.internal"
    domain_name_servers = ["AmazonProvidedDNS"]

    tags {
        Name = "${var.project}-dhcp-options"
    }
}
