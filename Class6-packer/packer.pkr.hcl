packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "linux" {
  ami_name      = "kaizen {{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami = "ami-041feb57c611358bd"
  ssh_username = "ec2-user"
  ssh_keypair_name = "packer"
  ssh_private_key_file = "~/.ssh/id_rsa"

#   #to create/copy in/to different regions at once
#   ami_regions = [
#     "us-east-1",
#     "us-east-2",
#     "us-west-1"
#   ]

#   #to copy golden image to others aws users accounts
#   #it will copy/delete to specifyied regoin
#   ami_users = [
#     "864090172158",
#     "543566043699"
#   ]

  run_tags = {
    Name = "Golden Image"
  }
}

build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.linux"
  ]

  provisioner "shell" {
    script = "setup.sh"
  }

  provisioner "breakpoint" {
    note = "Please verify"
  }
}
