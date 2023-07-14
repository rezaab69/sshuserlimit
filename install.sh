#!/bin/sh

os="$(egrep '^(ID)=' /etc/os-release | grep -E -o [a-z]+)"

if [ "$os" == "ubuntu" ]
then
	sudo apt update
	sudo apt install git wget -y
else
then
	echo "Currently only Ubuntu is supported."
 	exit
fi

arch="$(uname -i)"

if [ "$arch" == "x86_64" ]
then
	sudo wget -O /usr/bin/netstat "https://github.com/rezaab69/sshuserlimit/raw/main/netstat_x86_64"
	sudo chmod +x /usr/bin/netstat
elif [ "$arch" == "aarch64" ]
then
	sudo wget -O /usr/bin/netstat "https://github.com/rezaab69/sshuserlimit/raw/main/netstat_aarch64"
	sudo chmod +x /usr/bin/netstat
fi

sudo wget -O /usr/local/bin/InoVPN-Single-User.sh "https://github.com/rezaab69/sshuserlimit/raw/main/InoVPN-Single-User.sh"
sudo chmod +x /usr/local/bin/InoVPN-Single-User.sh
sudo echo "auth       required     pam_exec.so /usr/local/bin/InoVPN-Single-User.sh" >> /etc/pam.d/sshd
sudo echo "account    required     pam_exec.so /usr/local/bin/InoVPN-Single-User.sh" >> /etc/pam.d/sshd
