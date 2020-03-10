provider "aws" {
  alias = "us-east-1"
  version = "~> 2.0"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  version = "~> 2.0"
  region  = "us-east-2"  
}

resource "aws_instance" "dev" {
  provider = aws.us-east-2
  count = 2
  ami = var.amis["us-east-2-ubuntu18"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "david_dev_${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.david_acesso_ssh.id]
}

resource "aws_instance" "dev3" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2-amzLinux"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "david_dev_3"
  }
  vpc_security_group_ids = [aws_security_group.david_acesso_ssh.id]
  depends_on = [aws_s3_bucket.david_dev]
}

resource "aws_instance" "dev4" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2-amzLinNetCoreMono"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "david_dev_4"
  }
  vpc_security_group_ids = ["${aws_security_group.david_acesso_ssh.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-2
  name = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "UserId"
  range_key = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}