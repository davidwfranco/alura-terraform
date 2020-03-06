provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"  
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-0fc20dd1da406780b"
  instance_type = "t2.micro"
  key_name = "dwfranco_kp"
  tags = {
    Name = "david_dev_${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.david_acesso_ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-0fc20dd1da406780b"
  instance_type = "t2.micro"
  key_name = "dwfranco_kp"
  tags = {
    Name = "david_dev_4"
  }
  vpc_security_group_ids = ["${aws_security_group.david_acesso_ssh.id}"]
  depends_on = [aws_s3_bucket.david_dev_4]
}

resource "aws_instance" "dev5" {
  ami = "ami-0fc20dd1da406780b"
  instance_type = "t2.micro"
  key_name = "dwfranco_kp"
  tags = {
    Name = "david_dev_5"
  }
  vpc_security_group_ids = ["${aws_security_group.david_acesso_ssh.id}"]
}

resource "aws_security_group" "david_acesso_ssh" {
  name        = "david_acesso_ssh"
  description = "david_acesso_ssh"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "david_acesso_ssh"
  }
}

resource "aws_s3_bucket" "david_dev_4" {
  bucket = "tf-test-david-dev-4"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "david_dev"
  }
}