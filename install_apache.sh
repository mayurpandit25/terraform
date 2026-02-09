#!/bin/bash
set -xe

apt-get update -y
apt-get install -y apache2

systemctl start apache2
systemctl enable apache2

echo "<h1>Apache2 has been installed and started successfully</h1>" > /var/www/html/index.html
systemctl restart apache2
