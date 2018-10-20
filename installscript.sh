#! /bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-setuptools
sudo apt-get install yad

if [ -x "$(command -v easy_install)" ]
then
    sudo easy_install shodan
else
    sudo apt-get install python-pip
    sudo pip install shodan
fi

sudo chmod +x *sh
