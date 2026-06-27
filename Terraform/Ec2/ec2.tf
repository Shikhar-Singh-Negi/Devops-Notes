# ec2 ke liye ek key-pair chaiye hota hai.
# to generate a ke command:-   ssh-keygen

resource aws_key_pair my_key {
    key_name = "my-key"
    public_key = file("filename.pub")    #we also can write ssh key value.
}

# ek VPC & Security Group

resource aws_default_vpc default {

}

resource aws_security_group my_security {
    name = "automate-sg"
    description = "Security Group for Automate.txt"
    vpc_id      = aws_default_vpc.default.id     # interpolation

    # inbound rules
    ingress {
        from_port = 22    # ssh port
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]   #source
        description = "ssh Open"
    }
    # outbound rules
    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"    # all access.
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound"
    }
}

# ek ec2 instance

resource aws_instance my_instance {
    #argument 
   
   # count = 2  #[meta argument]ye itne resource bana dega
    for_each = tomap({
        automate-micro = "t2.micro",
        automate-small = "t2.small"
    }) # this meta argument will create 2 instance

    depends_on = [ aws_security_group.my_security ] #meta argument

    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security.name]  # interpolation
    #instance_type = var.ec2_instance_type
   
   # for each ke liye hai.
    instance_type = each.value
   
    ami = var.ec2_ami_id
    user_data = file("install_nginx.sh")  # to install nginx on instance. It allows us to run some commands. in startup
    

    root_block_device {
        volume_size = var.env == "prod" ? 20 : var.ec2_default_root_storage_size
        volume_type = "gp3"

    }
    tags = {
        # for each ke liye hai
        # name = each.key
        Name = "name you want to give"
    }

}

# # Server import jiska koi idea nahi hai.
# resource "aws_instance" "my_new_instance" {
#     ami = "unknown"
#     instance_type = "unknown"

# # terraform import aws_instance.my_new_instance <id>
# }




# to check it is ok
# terraform validate

# To initilaze terraform and plugins
# terraform init

# to see what will be created
# terraform plan

# to create
# terraform apply

# to destroy
# terraform destroy