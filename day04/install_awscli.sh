#!/bin/bash

install_awscli(){
	echo "Installing aws cli and dependencies"
	sudo apt update -y
	sudo apt install unzip -y
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
	unzip awscliv2.zip 
	sudo ./aws/install ||
	       	{
			echo "Failed to install aws cli"
			return 1
		}				
	}

if ! install_awscli; then 
	exit 1
fi


