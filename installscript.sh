#! /bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-setuptools
sudo apt-get install yad

if [ -x "$(command -v easy_install)" ]
then
    sudo easy_install shodan
else
    # fallback to pip (On Ubuntu bionic for example)
    sudo apt-get install python-pip
    sudo pip3 install shodan
fi

sudo chmod +x *sh
