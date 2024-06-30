#!/bin/bash

<< disclaimer
This is just another script
disclaimer

# function definition

function is_member() {
read -p "Enter the member name: " member
read -p "Community member %" commmber

if [[ $member == "Mark" ]];
then 
	echo "Valid Member"
elif [[ $commember -ge 100 ]];
then 
	echo "Valid Member"
else
	echo "Not a Valid Member"
fi
}

# function call
is_member 
