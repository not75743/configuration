resource "aws_subnet" "pubsub" {
  availability_zone = "ap-northeast-1a"
  cidr_block = "192.168.100.0/24"
  customer_owned_ipv4_pool = ""
  map_customer_owned_ip_on_launch = false
  map_public_ip_on_launch = false
  outpost_arn = ""
  assign_ipv6_address_on_creation = false
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.name}-pubsub"
  }
}
