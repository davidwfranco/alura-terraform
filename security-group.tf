resource "aws_security_group" "david_acesso_ssh" {
  provider = aws.us-east-2
  name        = "david_acesso_ssh"
  description = "david_acesso_ssh"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "david_acesso_ssh"
  }
}