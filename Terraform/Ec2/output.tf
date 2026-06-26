# hum isse output check karsakte hai.
output "ec2_public_ip" {
    #instance ka naam
    value = aws_instance.my_instance[*].public_ip # for multiple output

}

output "ec2_public_dns" {
    value = aws_instance.my_instance[*].public_dns  
    
}


# this is for_each

output "ec2_public_ip" {
    value = [
         for key in aws_instance.my_instance : key.public_ip 
         ]
}