variable "amis" {
  type = map
  description = "AMI images to be used on the project"
  default = {
    us-east-2-amzLinux = "ami-0998bf58313ab53da"
    us-east-2-ubuntu18 = "ami-0fc20dd1da406780b"
    us-east-2-amzLinNetCoreMono = "ami-0d81e0df3d81afaed"
  }
}

variable "cdirs_acesso_remoto" {
  type = list
  default = ["0.0.0.0/0","127.0.0.1/32"]
}

variable "key_name" {
  type = string
  description = "Chave ssh gerada para uso"
  default = "dwfranco_kp"
}