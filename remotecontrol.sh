#!/bin/bash

figlet -f smmono9 Remote Control 
echo

#1. Install relevant applications on the local computer

	echo "[***] Initiating Packages Installation [***]"
	echo
function inst() 
{
	echo
	sudo apt install curl
	echo
	echo "[*] Curl Succesfully Installed [*]"
	echo
	sudo apt install sshpass
	echo
	echo "[*] SSH Pass Succesfully Installed [*]"
	echo
	git clone https://github.com/htrgouvea/nipe && cd nipe
        sudo cpan install Try::Tiny Config::Simple JSON
        perl nipe.pl install
	echo
	echo "[*] Nipe Succesfully Installed [*]"
	echo
}
inst

#2. Check if the connection is from your origin country

function anon()
{
cntry=$(curl -s ifconfig.io/country_code)

if [ "$cntry" == "SG" ]
then
	echo "You are currently viewing from Singapore!"
	sudo perl nipe.pl start
	sudo perl nipe.pl restart
	echo
	echo "[*] Running Nipe... [*]"
	sleep 0.5
	echo
	echo "[*] Nipe Succesfully Initiated [*]"
	anon
else
	echo
	echo "You are anonymous now!"
fi
}
anon

#3. Communicate via SSH and execute nmap scans and whois queries

function vps()
{
	echo
	read -p "Please enter your IP address to connect to server:" ip
	echo
	echo "[*] Connecting to Server... [*]"
	echo
	sleep 0.5
	SSHPASS='rEmotecontro1l' sshpass -e ssh -t ns@$ip 'read -p "Please enter IP for scanning:" scanip; nmap $scanip > nmapscan.txt; whois $scanip > whoisscan.txt; echo; echo "[*] NMAP and WHOIS Scanning Complete [*]"; echo; bash -l'
	echo
}

vps

#3.1 Get input from the user: nmap and whois

#inst	#run installation
#anon	#check anonymous
#vps	#connect and execute

#All credits goes to the respective owner / creator of the tools used in this project.
#Sources:
#https://www.redhat.com/sysadmin/ssh-automation-sshpass
#https://stackoverflow.com/questions/12202587/automatically-enter-ssh-password-with-script
#https://github.com/htrgouvea/nipe
#https://github.com/nmap/nmap
#https://github.com/rfc1036/whois
#https://github.com/curl/curl
#https://www.tecmint.com/sshpass-non-interactive-ssh-login-shell-script-ssh-password/
