resource "aws_security_group" "tf_df_infra_nat" {
        name = "tf_df_infra_nat"
        description = "Permite trafego da rede interna"
        vpc_id = "${var.vpcid}"
        ingress {
                from_port = 0
                to_port = 0
                protocol = "-1" /*-1 ALL Traffic*/
                cidr_blocks = ["${var.vpccidr_block}"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1" /*-1 ALL Traffic*/
                cidr_blocks = ["0.0.0.0/0"]
        }

        tags {
                Name = "tf_df_infra_nat"
                Description = "Terraform default infra NAT"
             }
}

resource "aws_security_group" "tf_df_infra_access" {
        name = "tf_df_infra_access"
        description = "Security group Liberanco acesso de ssh rdp etc"
        vpc_id = "${var.vpcid}"

        ingress {
                from_port = 22
                to_port = 22
                protocol = "6"
                cidr_blocks = ["10.10.0.0/20" , "10.20.0.0/20"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }

        tags {
                Name = "tf_df_infra_access"
                Description = "Terraform default infra access"
        }
}


resource "aws_security_group" "tf_df_infra_sql" {
        name = "tf_df_infra_sql"
        description = "Security Group Liberanco acesso de banco de dados"
        vpc_id = "${var.vpcid}"

        ingress {
                from_port = 3306
                to_port = 3306
                protocol = "6"
                cidr_blocks = ["10.10.0.0/20" , "10.20.0.0/20"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }

        tags {
                Name = "tf_df_infra_sql"
                Description = "Terraform default infra SQL"
        }
}


