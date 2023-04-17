provider "aws" {
 region = var.region
}

terraform {
  backend "s3" {
    bucket  = "tariel-remote-state"
    key     = "lambda/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
