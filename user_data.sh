#!/usr/bin/bash

#Installing packages
sudo yum update -y 
sudo yum install -y nano tree git
sudo yum install -y gcc
sudo yum install -y python3-devel pip3
sudo yum install -y postgresql-devel
sudo yum install -y postgresql
sudo yum install -y python3 
amazon-linux-extras install -y nginx1

sudo pip3 install psycopg2
sudo pip3 install boto3

#Start & enable services
systemctl start nginx
systemctl enable nginx
systemctl stop postfix
systemctl disable postfix

#Connect to DB
cd /home/ec2-user
pip3 install --user psycopg2
pip3 install --user boto3
