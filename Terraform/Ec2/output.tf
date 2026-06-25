# hum isse output check karsakte hai.
output "ec2_public_ip" {
    #instance ka naam
    value = aws_instance.my_instance.public_ip

}

output "ec2_public_dns" {
    value = aws_instance.my_instance.public_dns
    
}