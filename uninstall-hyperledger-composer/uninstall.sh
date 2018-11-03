#!/bin/bash
# A sample Bash script to uninstall hyperledger composer by Tanmoy Krishna Das

#uninstall npm modules
npm uninstall -g composer-cli 
npm uninstall -g composer-rest-server 
npm uninstall -g generator-hyperledger-composer
npm uninstall -g yo
npm uninstall -g composer-playground

#remove composer files
rm -rf ~/.composer
rm -rf ~/.fabric-tools

#remove docker images
# Warning: This will remove all docker images on your system,
# so if you have any important docker images that you might want to use, skip the following steps
read -p "Do you want to remove all docker images of Hyperledger Fabric? (Y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker kill $(docker ps -q);;
	docker rm $(docker ps -aq);;
    docker rmi $(docker images dev-* -q);;
fi
