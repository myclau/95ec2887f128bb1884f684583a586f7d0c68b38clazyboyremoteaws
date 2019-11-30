#!/bin/bash
sudo apt-get install python3-pip -y
pip3 --version
echo "pip3 install completed"
pip3 install awscli --upgrade --user

aws --version
echo "awscli install completed"
