##############################################
# Get latest Ubuntu Linux AMI with Terraform #
##############################################

# Get latest Ubuntu Linux Bionic Beaver 18.04 AMI
# data "aws_ami" "ubuntu-linux-1804" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# Get latest Ubuntu Linux Focal Fossa 20.04 AMI
# data "aws_ami" "ubuntu-linux-2004" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# Get latest Ubuntu Linux Jammy Jellyfish 22.04 AMI
# data "aws_ami" "ubuntu-linux-2204" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# Get Netcubed Ubuntu Desktop 20.04 AMI
data "aws_ami" "netcubed-ubuntu-desktop" {
  most_recent = true
  include_deprecated = true
  owners      = ["679593333241"] # 
  filter {
    name   = "name"
    values = ["netcubed/amd64/ubuntu-desktop-20.04-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Get Netcubed Ubuntu Desktop 22.04 AMI
# data "aws_ami" "netcubed-ubuntu-desktop" {
#   most_recent = true
#   owners      = ["679593333241"] # 
#   filter {
#     name   = "name"
#     values = ["netcubed/base/amd64/ubuntu-22.04*"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# output Ubuntu AMI IDs

# output "ubuntu_1404_ami_id" {
#   value = data.aws_ami.ubuntu-linux-1404.id
# }

# output "ubuntu_1604_ami_id" {
#   value = data.aws_ami.ubuntu-linux-1604.id
# }

# output "ubuntu_1804_ami_id" {
#   value = data.aws_ami.ubuntu-linux-1804.id
# }

#output "ubuntu_2004_ami_id" {
#  value = data.aws_ami.ubuntu-linux-2004.id
#}

# output "ubuntu_2204_ami_id" {
#   value = data.aws_ami.ubuntu-linux-2204.id
# }

output "netcubed-ubuntu-desktop_id" {
  value = data.aws_ami.netcubed-ubuntu-desktop.id
}
