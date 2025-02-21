###################################
## Virtual Machine Module - Main ##
###################################

#Create random password
resource "random_string" "password" {
  length  = 10
  special = false
}

# Get my own ip
data "http" "myip" {
  url = "https://ifconfig.me"
}


# Create Elastic IP for the EC2 instance
resource "aws_eip" "linux-eip" {
  #vpc = true
  domain = "vpc"
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-eip"
    Environment = var.app_environment
    F5SE = var.f5_se
  }
}

# Create EC2 Instance
resource "aws_instance" "linux-server" {
  #  count =                     1
  ami                         = data.aws_ami.netcubed-ubuntu-desktop.id
#  ami                         = "ami-035f1f1c2b60c094a"
#  ami                         = "ami-0373b4f779ad922f6"
  instance_type               = var.linux_instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.aws-linux-sg.id]
  associate_public_ip_address = var.linux_associate_public_ip_address
  source_dest_check           = false
  key_name                    = aws_key_pair.key_pair.key_name
  #user_data                   = file("aws-user-data.sh")

  # root disk
  root_block_device {
    volume_size           = var.linux_root_volume_size
    volume_type           = var.linux_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.linux_data_volume_size
    volume_type           = var.linux_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-desktop"
    Environment = var.app_environment
    F5SE        = var.f5_se
  }
}

# Associate Elastic IP to Linux Server
resource "aws_eip_association" "linux-eip-association" {
  #  instance_id   = aws_instance.linux-server.id
  instance_id   = aws_instance.linux-server.id
  allocation_id = aws_eip.linux-eip.id
}

# Define the security group for the Linux server
resource "aws_security_group" "aws-linux-sg" {
  name        = "${lower(var.app_name)}-${var.app_environment}-linux-sg"
  description = "Allow incoming HTTP connections"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }

  ingress {
    description = "juiceshop"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH for mgmt"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #cidr_blocks = ["${data.http.myip.response_body}/32"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTPS connections"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-sg"
    Environment = var.app_environment
    F5SE        = var.f5_se
  }
}

