#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
LOCAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
echo "<h1>Welcome to EC2 Instance - $LOCAL_IP</h1>" > /var/www/html/index.html