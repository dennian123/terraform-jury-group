resource "aws_instance" "web" {
  ami           = "ami-036f5574583e16426"
  instance_type = "t2.micro"
  availability_zone = "us-east-2a"
  key_name = aws_key_pair.deployer.key_name

  #ussually using Anzible -> to copy files from local to remote machine
  #scp main.tf ec2-user@IP: hello.tf   Copying from Bastion -> abowe aws_instance
  provisioner "file" {
    source = "./main.tf"
    destination = "./hello.tf"
  }
  connection{
    host = element(aws_instance.web.*.public_ip, 0)
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }

}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}