#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
echo "<h1> Apache2 has been installed and started successfully </h1>" > /var/www/html/index.html
sudo systemctl restart apache2
sudo systemctl enable apache2 