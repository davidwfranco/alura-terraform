terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "davidwfranco"

    workspaces {
      name = "alura-terraform"
    }
  }
}