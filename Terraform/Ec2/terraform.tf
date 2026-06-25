# yaha pe aws/ ya jis cloud ko use karna hai uska provider dalna hai.
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.91.0"
        }
    }
}
