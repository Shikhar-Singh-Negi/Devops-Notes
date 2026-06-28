# yaha pe aws/ ya jis cloud ko use karna hai uska provider dalna hai.
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.91.0"
        }
    }

    backend "s3" {
      bucket = "bucket-using-terraform"
      key = "terraform.tfstate"
      region = "us-east-2"
      dynamodb_table = "State_Table"   #For StateLocking

    }
}

##note :-
        # command after changig terraform block
            # terraform init

# Ab humse agar state bhi delete ho jayegi tha bhi koi dikkat nahi hai
#  ab state file remote backend backup me save ho rhi hai.