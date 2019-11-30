#!/bin/bash

function awssh(){
	tagname=${1}
	username=${2-ec2-user}
	pemname=${3-aws-default.pem}

	if [ -z "$tagname" ] ; then
		echo "tagname cannot be empty"
		return 1
	fi

	ipaddress=$(aws ec2 describe-instances --filter Name=tag:Name,Values="$tagname" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
	if [ "$ipaddress" = "" ] ; then
               echo "Host not found / No Public Address"
               return 1
        fi
	echo "ssh -i \"~/awssh/$pemname\" ec2-user@$ipaddress" 

	ssh -i "~/awssh/$pemname" ec2-user@$ipaddress
}