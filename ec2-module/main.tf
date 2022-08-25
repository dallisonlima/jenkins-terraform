resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instancetype
  user_data = <<EOF
    #!/bin/bash

    sudo yum update -y

    sudo yum install -y gcc

    sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
  EOF
}