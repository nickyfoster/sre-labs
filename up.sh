#! /bin/bash

lab_ec2_name=$1

# Check if argument is passed
if [ -z "$lab_ec2_name" ]
then
    echo "Please provide an EC2 name"
    exit 1
fi

# Create infrastructure
cd terraform
terraform init
terraform apply -var="ec2_name=$lab_ec2_name"
  
terraform output -raw private_key > ../ansible/keys/$lab_ec2_name.pem
cd ../ansible && chmod 600 keys/$lab_ec2_name.pem && ssh-add keys/$lab_ec2_name.pem