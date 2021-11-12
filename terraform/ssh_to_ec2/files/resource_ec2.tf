resource "aws_instance" "ec2" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${aws_key_pair.sshkey.id}"
  subnet_id                   = "${aws_subnet.pubsub.id}"
  private_ip                  = "192.168.100.100"
  security_groups             = ["${aws_security_group.sg.id}"]
  associate_public_ip_address = true
  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }
  tags = {
    Name = "${var.name}-ec2"
  }
}
