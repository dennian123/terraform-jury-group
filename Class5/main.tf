provider aws {
    region = "us-east-2"
}

# # #local-exect provisioner:
# # #-execute command locally(from where this command runs)
# # #-terraform wont be able to destroy it bc its not managed by terraform
# # resource "null_resource" "cluster" {
# #   provisioner "local-exec" {
# #     command = "mkdir kaizen && touch testfile"
# #   }
# # }

# #COMMENTED OUT BC WHERE WORKING ON NEXT FILE
# #remote-exect provisioner:
# #to see live instalation process(will see the commands execution in terminal while httpd installing
# resource "null_resource" "cluster" {
#   triggers = {
#     always_run = "${timestamp()}" 
#     #everytime it runs will have a new timestamp(it will see a change to our configurations, wich make it to apply)
#     #1 to add, 1 to destroy (if no changes where made)
#   }

#   connection {
#         #how to connect to the instance. to wich instance to connect
#     host = element(aws_instance.web.*.public_ip, 0)
#         #wich user to use. type of the connection(google:provisioner connection blok)
#     type = "ssh"
#     user = "ec2-user"
#     private_key = file("~/.ssh/id_rsa")
#   }

#   provisioner "remote-exec" {  
#     inline = [
#         #mkdir kaizen  --> it will create folder on remote machine
#         "sudo yum install httpd -y",
#         "sudo systemctl start httpd",
#         "sudo systemctl enable httpd"
#     ]
#   }
# }