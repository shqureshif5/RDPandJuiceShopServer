# Terraform AWS Ubuntu EC2 Instance

Deploy an AWS EC2 Instance running Ubuntu using Terraform

To update the version of Ubuntu, just update the **ami** line in the **linux-vm-main.tf** file, with a variable from the **ubuntu-versions.tf** file.

In this file, we support the latest builds of versions 14.04, 16.04, 18.04, and 20.04.

Blog --> https://gmusumeci.medium.com/how-to-deploy-an-ubuntu-linux-ec2-instance-in-aws-using-terraform-330199d93dd8

# What it does
Once the base server is deployed, there are a number of scripts that install and setup an environment for testing.

1. Deploys an RDP server, to allow upto 16 users to run Tools for REST-API labs - postman, visual studio code, and ansible.

2. Installs an instance of juiceshop in docker.

# Howto
Login with user "ubuntu". SSH access is with pem key. RDP access password is the instance-id.  

Log in as user "ubuntu" and add "Firefox", "Mate Terminal", "Postman" and "VScode" to Desktop Shortcuts.  

Create "apply_desktop_shortcuts.sh", do "chmox u+x" and run
Create "assign_passwords.sh", change password to your likings, do "chmod u+x" and run

