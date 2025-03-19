resource "null_resource" "file_provisioner" {
   connection {
      type ="ssh"
      user =  var.connection_user
      agent= false
      host = var.ec2_public_ip
      private_key = file(var.pem_file)
   }
    provisioner "file" {
        source = var.source_path
        destination = var.destination_path
    }
}