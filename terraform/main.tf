provider "aws" {
  region = "eu-west-1"
}

# Create a security group that allows inbound traffic on port 8080
resource "aws_security_group" "web_sg" {
  name        = "web-instance-sg"
  description = "Allow inbound traffic on port 8080"

  ingress {
    from_port   = 8080  # Allow inbound traffic on port 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from any IP (or restrict to specific IPs)
  }

  egress {
    from_port   = 0  # Allow all outbound traffic
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-instance-sg"
  }
}

# Create the EC2 instance and attach the security group
resource "aws_instance" "web" {
  count         = 1  # Create only one instance
  ami           = "ami-03fd334507439f4d1"  # Replace with your desired AMI
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_sg.name]  # Attach the security group

  tags = {
    Name = "web-instance-${count.index}"
  }
}

output "instance_ips" {
  value = aws_instance.web[*].public_ip
}
