#!/usr/bin/env sh
sudo apt update
sudo apt install nginx -y
systemctl enable nginx
systemctl start nginx
