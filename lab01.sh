#! /bin/bash

lab_ec2_name=$1

# Check if argument is passed
if [ -z "$lab_ec2_name" ]
then
    echo "Please provide an EC2 name"
    exit 1
fi

cd ansible && ansible-playbook lab01_playbook.yml -e target=$lab_ec2_name