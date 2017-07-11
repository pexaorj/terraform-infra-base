resource "aws_instance" "app_a" {
  ami = "ami-8b92b4ee"
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${var.sg_admin_id}"]
  subnet_id = "${var.subnet_app_a}"

  tags {
    Name = "app-a"
  }
}

