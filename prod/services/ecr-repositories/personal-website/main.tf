terraform {
  required_version = ">=0.12, < 0.13"
}

provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
  }
}


module "ecr_repository_personal_website" {
  source = "github.com/nickolasteixeira/personal_terraform_modules//modules/aws/ecr-repository?ref=v0.0.3"
  name = var.name
  scan_on_push = var.scan_on_push
  encryption_type = var.encryption_type
  image_tag_mutability = var.image_tag_mutability
}
