resource "aws_key_pair" "sshkey" {
  key_name   = "${var.name}-sshkey"
  public_key = file("${var.pubkey_path}")
}
