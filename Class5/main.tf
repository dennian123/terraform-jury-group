provider aws {
    region = "us-east-2"
}


# resource "null_resource" "cluster" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }
# #connection, provisioner blocks - not neceserly must be inside "null_resource block"
# #they may be even iside instance block
#   connection {
#     host = element(aws_instance.web.*.public_ip, 0)
#     user = "ec2-user"
#     type = "ssh"
#     private_key = file("~/.ssh/id_rsa")
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum install httpd -y",
#       "sudo systemctl start httpd",
#       "sudo systemctl enable httpd"
#     ]
#   }
# }