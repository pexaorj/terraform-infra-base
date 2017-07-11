resource "aws_eip" "nat_a" {
  vpc      = true
}
resource "aws_eip" "nat_c" {
  vpc      = true
}
