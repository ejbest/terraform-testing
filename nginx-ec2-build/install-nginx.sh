#!/bin/bash
sudo apt update
sudo apt install nginx
systemctl enable nginx
systemctl start nginx
