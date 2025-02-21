#! /bin/bash

#numusers=8

#############################
# CREATE LOCAL USERS
#############################

for i in {1..16}; do
  echo "Creating student$i"
  sudo useradd -m -d /home/student$i -s /bin/bash student$i;
done

#############################
# Assign password to all users
# Password is from the tf output variable "rds_password"
#############################

rds_password=$1
filename=user.pw

for i in {1..16}; do
  echo "student$i:$rds_password" >> $filename;
done

sudo chpasswd < $filename

rm $filename