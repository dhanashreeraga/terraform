resource "null_resource" "name" {
   connection {
      type ="ssh"
      user =  var.connection_user
      agent= false
      host = var.ec2_public_ip
      private_key = file(var.pem_file)
   }
    provisioner "remote-exec" {
       inline  = var.commands
    }
}