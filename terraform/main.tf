provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count         = 1  # Create only one instance
  ami           = "ami-03fd334507439f4d1"  # Replace with your desired AMI
  instance_type = "t2.micro"

  tags = {
    Name = "web-instance-${count.index}"
  }
}

output "instance_ips" {
  value = aws_instance.web[*].public_ip
}
