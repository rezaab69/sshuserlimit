#!/bin/bash

os = $(egrep '^(ID)=' /etc/os-release | grep -E -o "[a-z]+")

if $os=='centos'; then
	sudo yum install git wget -y
elif $os=='ubuntu'; then
	sudo apt apdate
	sudo apt install git wget -y
	

arch = $(uname -i)

if $arch=='x86_64'; then
	sudo wget -O /usr/bin/netstat "https://github.com/rezaab69/sshuserlimit/raw/main/netstat_aarch64"
	sudo chmod +x /usr/bin/netstat
elif $arch=='aarch64'; then
	sudo wget -O /usr/bin/netstat "https://github.com/rezaab69/sshuserlimit/raw/main/netstat_x86_64"
	sudo chmod +x /usr/bin/netstat

sudo wget -O /usr/local/bin/InoVPN-Single-User.sh "https://github.com/rezaab69/sshuserlimit/raw/main/InoVPN-Single-User.sh"
chmod +x /usr/local/bin/InoVPN-Single-User.sh
sudo echo "\n\naccount    required     pam_exec.so /usr/local/bin/InoVPN-Single-User.sh\nauth       required     pam_exec.so /usr/local/bin/InoVPN-Single-User.sh" >> /etc/pam.d/sshd

