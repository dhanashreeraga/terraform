resource "aws_instance" "my_instances" {
     ami = var.ec2_ami
    instance_type = var.ec2_type
     key_name = var.pem_key
     tags = {
                 Name = "terraform_ec2"
      } 
       }