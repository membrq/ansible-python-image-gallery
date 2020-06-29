#!/usr/bin/bash

export IMAGE_GALLERY_SCRIPT_VERSION="1.0"
export IMAGE_GALLERY_BUCKET_NAME="ig.private-data-config"

#Install packages
yum -y update
yum install -y tree gcc python3-devel pip3 postgresql-devel postgresql
yum install -y git python3
amazon-linux-extras install -y nginx1

#Copy SSH key
echo "echo-rsa KEY" >>${HOME}/.ssh/authorized_keys
#where does HOME var come from?

#Configure/install custom software
cd /home/ec2-user
git clone https://github.com/membrq/python-image-gallery.git
chown -R ec2-user:ec2-user python-image-gallery
su ec2-user -l -c "cd ~/python-image-gallery && pip3 install -r requirements.txt --user"

#Copy conf files
aws s3 cp s3://$IMAGE_GALLERY_BUCKET_NAME/nginx/nginx.conf /etc/nginx/nginx.conf
aws s3 cp s3://$IMAGE_GALLERY_BUCKET_NAME/nginx/default.d/image_gallery.conf /etc/nginx/default.d/image_gallery.conf

#Start/enable services
systemctl stop postfix
systemctl disable postfix
systemctl start nginx
systemctl enable nginx

su ec2-user -l -c "cd ~/python-image-gallery && ./start" >/var/log/image_gallery.log 2>&1 &
