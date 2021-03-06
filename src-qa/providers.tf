terraform {
  required_version = "~> 0.14"

 # required_providers {
  #  aws = {
  #    source  = "hashicorp/aws"
  #   version = "~> 3.0"
  #  }
  #}

  backend "s3" {
    bucket = "atabek"
    key    = "./terraform-s3-static-website/src-qa/.terraform/qa-terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}
