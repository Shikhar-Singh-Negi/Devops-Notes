# This is copy from terraform-docs. TThis is a provider file
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.91.0"
        }
    }
}

# terraform init