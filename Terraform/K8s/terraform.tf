terraform {
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "5.91.0"
    }
  }
}


# TO run these

# terraform init
# terraform validate
# terraform plan
# terraform apply
# terraform destroy