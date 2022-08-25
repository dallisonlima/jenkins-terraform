resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instancetype
  key_name = "homebrew-teste"
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y git
    wait git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    sudo mkdir ~/.linuxbrew/bin
    sudo ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
    sudo eval $(~/.linuxbrew/bin/brew shellenv)
  EOF

  tags = {
    Name = "CreateByJenkinsPipeline"
  }
}