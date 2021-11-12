resource "aws_security_group" "sg" {
  name        = "${var.name}-sg"
  description = "${var.name}-sg"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.name}-sg"
  }
}

# inbound(SSH only)
resource "aws_security_group_rule" "inbound_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.ssh_to_ec2}"]
  security_group_id = "${aws_security_group.sg.id}"
}

# outbound
resource "aws_security_group_rule" "outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg.id}"
}
