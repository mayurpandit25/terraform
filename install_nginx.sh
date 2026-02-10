#!/bin/bash
sudo apt-get udpate
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo echo "<h1> Welcome to terraform </h1>" | sudo tee /var/www/html/index.html