resource "aws_instance" "nat_c" {
  ami = "ami-6793b702"
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${var.sg_nat_id}"]
  subnet_id = "${var.subnet_dmzc}"
  source_dest_check = false
  associate_public_ip_address = "true"

  tags {
    Name = "nat-instance-c"
  }
}

resource "aws_eip_association" "eip_assoc_nat_c" {
  instance_id = "${aws_instance.nat_c.id}"
  allocation_id = "${var.eip_nat_c_id}"
}
