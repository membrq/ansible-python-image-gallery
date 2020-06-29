#!/usr/bin/bash

#Installing packages
sudo yum update -y 
#sudo yum install -y nano tree python3 git
#sudo yum install -y gcc
#sudo yum install -y python3-devel
#sudo yum install -y postgreql-devel

#sudo yum install -y git python3
#sudo yum install -y tree gcc python3-devel pip3 postgresql-devel postgresql
sudo yum install -y postgresql
sudo yum install -y gcc
sudo yum install -y python3-devel
sudo yum install -y postgresql-devel
#Connect to DB
sudo pip3 install psycopg2
sudo pip3 install boto3


cd /home/ec2-user
pip3 install --user boto3
pip3 install --user psycopg2