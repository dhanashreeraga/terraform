module "create_ec2" {
        source = "./modules/create_ec2" 
        ec2_ami = "ami-00bb6a80f01f03502"
         ec2_type =  "t2.micro"
         pem_key= "my-secondaws"
}
 module  "copy_install" {
      source = "./modules/file"
        connection_user = "ubuntu"
        ec2_public_ip =  module.create_ec2.public_ip
        pem_file = "./keys/my-secondaws.pem"
        source_path = "./config/install.sh"
        destination_path= "/home/ubuntu/install.sh"
   
 }
 module "run_remote_commands" { 
        source = "./modules/remote-exec"
        connection_user = "ubuntu"
        ec2_public_ip =  module.create_ec2.public_ip
        pem_file = "./keys/my-secondaws.pem"
        commands = ["chmod +x /home/ubuntu/install.sh", "sudo bash  /home/ubuntu/install.sh"]
        depends_on = [ module.copy_install ]
 }
  module "local_exec" {
      source = "./modules/local-exec"
      ec2_public_ip = module.create_ec2.public_ip

  }
