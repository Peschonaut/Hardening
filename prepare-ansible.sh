#!/bin/bash
#
# DevOps setup script, Summer-2017
#
# Written by Daniel Pesch <service@danielpesch.com>
#

echo "Which server do you want to set up? I can read hostnames and IP addresses [ENTER]:"
read hostname

if [ "$hostname" = "" ]; then
  hostname="0.0.0.0"
fi

echo "Installing and updating local ansible"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Ehm, Linux-Gnu
        sudo apt-get install -y software-properties-common
        sudo apt-add-repository ppa:ansible/ansible
        sudo apt-get update
        sudo apt-get install ansible
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        sudo easy_install pip
        sudo pip install ansible
        pip install git+git://github.com/ansible/ansible.git@devel
        sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
elif [[ "$OSTYPE" == "win32" ]]; then
        # Nopenopenopenope
        echo 'ugh'
else
        echo 'unsupported OS'
fi

echo "Installing and updating remote ansible (Ubuntu 14.04/16.04 only)"

ssh ubuntu@"$hostname" 'bash -s' < remote-install-ansible-ubuntu.sh

echo "Downloading and installing dependencies"
ansible-galaxy install --roles-path . -r default-roles.txt
