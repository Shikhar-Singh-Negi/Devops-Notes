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

resource aws_instance my_ec2 {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security.name]  # interpolation
    instance_type = var.ec2_instance_type
    ami = var.ec2_ami_id

    root_block_device {
        volume_size = var.ec2_root_storage_size
        volume_type = "gp3"

    }
    tags = {
        Name = "name you want to give"
    }

}

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