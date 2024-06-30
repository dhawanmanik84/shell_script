#!/bin/bash

<< task
Deploy Django app
and handle the code for errors
task

code_clone(){
	echo "Cloning the Django app..."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install ngnix -y
	sudo apt-get install curl
	curl -fsSL https://download.docker.com/linux/ubuntu/$(lsb_release -cs) /stable | sudo tee /etc/apt/sources.list.d/docker.list

}

required_restarts(){
	sudo apt-get update
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo systemctl start nginx
	sudo systemctl enable nginx
}

deploy(){
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
}

echo "*********** DEPLOYMENT STARTED ************"
if ! code_clone; then
	echo "the code directory already exists"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Installation failed"
	exit 1
fi

if ! required_restarts; then
	echo "System fault identified"
	exit 1
fi

deploy

echo "*********** DEPLOYMENT DONE **************"
