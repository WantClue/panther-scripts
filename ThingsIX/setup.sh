#!/bin/bash

#color codes
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE="\\033[38;5;27m"
SEA="\\033[38;5;49m"
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

#paths
dir_path="/etc/thingsix-forwarder"
timer_path="/etc/systemd/system/pantherx-watchdog.timer"
file_path_eu="/etc/global_conf.json.sx1250.EU868.template"
file_path_au="/etc/global_conf.json.sx1250.AU915.template"
file_path_ru="/etc/global_conf.json.sx1250.RU864.template"
file_path_kr="/etc/global_conf.json.sx1250.KR920.template"
file_path_in="/etc/global_conf.json.sx1250.IN865.template"
file_path_as="/etc/global_conf.json.sx1250.AS923_1.template"
file_path_us="/etc/global_conf.json.sx1250.US915.template"

file_path_eu_1="/etc/global_conf.json.sx1257.EU868.template"
file_path_au_1="/etc/global_conf.json.sx1257.AU915.template"
file_path_ru_1="/etc/global_conf.json.sx1257.RU864.template"
file_path_kr_1="/etc/global_conf.json.sx1257.KR920.template"
file_path_in_1="/etc/global_conf.json.sx1257.IN865.template"
file_path_as_1="/etc/global_conf.json.sx1257.AS923_1.template"
file_path_us_1="/etc/global_conf.json.sx1257.US915.template"
local_id="/etc/thingsix-forwarder/unknown_gateways.yaml"

function install() {
    echo -e "${GREEN}Module: Install ThingsIX${NC}"
	echo -e "${YELLOW}================================================================${NC}"
	if [[ "$USER" != "root" ]]; then
		echo -e "${CYAN}You are currently logged in as ${GREEN}$USER${NC}"
		echo -e "${CYAN}Please switch to the root account use command 'sudo su -'.${NC}"
		echo -e "${YELLOW}================================================================${NC}"
		echo -e "${NC}"
		exit
	fi
	if [[ $(lsb_release -d) != *Debian* && $(lsb_release -d) != *Ubuntu* ]]; then
                echo -e "${WORNING} ${CYAN}ERROR: ${RED}OS version $(lsb_release -si) not supported${NC}"
                echo -e "${CYNA}Official Panther Software is the recommended OS version .. please re-image and retry installation"
                echo -e "${WORNING} ${CYAN}Installation stopped...${NC}"
                echo
                exit
    fi
    if [ -d "$dir_path" ]; then
        echo -e "${CYAN}Directory exists${NC}"
    else
        echo -e "${RED}Directory does not exist${NC}"
        echo -e "${RED}Directory will be created ...${NC}"
        mkdir -p /etc/thingsix-forwarder
    fi

    sed -i 's/OnBootSec=600/OnBootSec=infinity/g;s/OnUnitActiveSec=600/OnUnitActiveSec=infinity/g' $timer_path

    OPTION=$(whiptail --title "Choose your Region" --menu "Choose the Region you deploy our Gateway" 20 60 10 \
    "1" "EU 868" \
    "2" "US 915" \
    "3" "KR 920" \
    "4" "AS 923" \
    "5" "AU 915" \
    "6" "IN 865" \
    "7" "RU 864" 3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        echo "Your chosen option: $OPTION"
        # Based on the chosen option, you change different regional plans
        case $OPTION in
        1)
            echo "EU868 chosen"
            if whiptail --yesno "Would you like to proceed and change the global conf?" 8 60; then
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_eu
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_eu
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_eu_1
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_eu_1
            else 
                echo "Aborted"
                exit
            fi
            # Execute your command for Option 1 here
        ;;
        2)
            echo "Option 2 chosen"
            echo "EU868 chosen"
            if whiptail --yesno "Would you like to proceed and change the global conf?" 8 60; then
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_us
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_us
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_us_1
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_us_1
            else 
                echo "Aborted"
                exit
            fi
            # Execute your command for Option 2 here
        ;;
        3)
            echo "Option 3 chosen"
            echo "EU868 chosen"
            if whiptail --yesno "Would you like to proceed and change the global conf?" 8 60; then
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_kr
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_kr
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_kr_1
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_kr_1
            else 
                echo "Aborted"
                exit
            fi
            # Execute your command for Option 3 here
        ;;
        4)
            echo "Option 4 chosen"
            echo "EU868 chosen"
            if whiptail --yesno "Would you like to proceed and change the global conf?" 8 60; then
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_as
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_as
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_as_1
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_as_1
            else 
                echo "Aborted"
                exit
            fi
            # Execute your command for Option 4 here
        ;;
        5)
            echo "Option 5 chosen"
            echo "EU868 chosen"
            if whiptail --yesno "Would you like to proceed and change the global conf?" 8 60; then
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_au
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_au
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_au_1
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_au_1
            else 
                echo "Aborted"
                exit
            fi
            # Execute your command for Option 5 here
        ;;
        6)
            echo "Option 6 chosen"
            echo "EU868 chosen"
            if whiptail --yesno "Would you like to proceed and change the global conf?" 8 60; then
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_in
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_in
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_in_1
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_in_1
            else 
                echo "Aborted"
                exit
            fi
            # Execute your command for Option 6 here
        ;;
        7)
            echo "Option 7 chosen"
            echo "EU868 chosen"
            if whiptail --yesno "Would you like to proceed and change the global conf?" 8 60; then
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_ru
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_ru
                sed -i 's/"serv_port_up": 1680,/"serv_port_up": 1688,/g' $file_path_ru_1
                sed -i 's/"serv_port_down": 1680,/"serv_port_down": 1688,/g' $file_path_ru_1
            else 
                echo "Aborted"
                exit
            fi
            # Execute your command for Option 7 here
        ;;
        esac
    else
        echo "You chose Cancel."
    fi

    if [[ $(docker ps -f "name=gwmp-mux" --format "{{.Names}}") == "gwmp-mux" ]]; then
        if whiptail --yesno "The Docker container 'gwmp-mux' is already running. Do you want to remove it?" 8 60; then
            docker stop gwmp-mux
            docker rm gwmp-mux
            echo "Container 'gwmp-mux' removed."
        else
            echo "Aborting..."
            exit
        fi
    fi

    if whiptail --yesno "Now we need to start the Docker Container for the thingsix mux are you ready?" 8 60; then
        docker run -d --restart unless-stopped --network host --name gwmp-mux ghcr.io/thingsixfoundation/gwmp-mux:latest --host 1688 --client 127.0.0.1:1680 --client 127.0.0.1:1685
    else
        exit
    fi

    if [[ $(docker ps -f "name=thingsix-forwarder" --format "{{.Names}}") == "thingsix-forwarder" ]]; then
        if whiptail --yesno "The Docker container 'thingsix-forwarder' is already running. Do you want to remove it?" 8 60; then
            docker stop thingsix-forwarder
            docker rm thingsix-forwarderx
            echo "Container 'thingsix-forwarder' removed."
        else
            echo "Aborting..."
            exit
        fi
    fi

    if whiptail --yesno "You're almost done we now need to start the actual forwarder Docker Container. Are you ready?" 8 60; then
        docker run -d --name thingsix-forwarder -p 1685:1680/udp --restart unless-stopped -v /etc/thingsix-forwarder:/etc/thingsix-forwarder ghcr.io/thingsixfoundation/packet-handling/forwarder:1.1.1 --net=main
    else
        echo "Aborted"
        exit
    fi

    sleep 1
    echo -e "${GREEN} You are done with the first step. Rerun the same command again${NC}"

}

function onboard() {
    echo -e "${GREEN}Module: Onboarding ThingsIX${NC}"
    echo -e "${CYAN}Now we will onboard your device onto the ThingsIX Network${NC}"
	echo -e "${YELLOW}================================================================${NC}"
    if [[ "$USER" != "root" ]]; then
		echo -e "${CYAN}You are currently logged in as ${GREEN}$USER${NC}"
		echo -e "${CYAN}Please switch to the root account use command 'sudo su -'.${NC}"
		echo -e "${YELLOW}================================================================${NC}"
		echo -e "${NC}"
		exit
	fi
    sleep 3

    if whiptail --yesno "You need to go into the WebUI of your Panther Miner now and disable the forwarder. After that enable the forwarder again. Have you done so?" 14 60; then
            id=$(grep -Po 'local_id: \K.*' $local_id)
            echo -e "${CYAN}Please enter your Polygon Wallet address to onboard this device to your Wallet${NC}"
            read wallet
    else
        echo "Aborted"
        exit
    fi

    docker exec thingsix-forwarder ./forwarder gateway onboard-and-push $id $wallet

}




if ! figlet -v > /dev/null 2>&1; then
	sudo apt-get update -y > /dev/null 2>&1
	sudo apt-get install -y figlet > /dev/null 2>&1
fi


if ! wget --version > /dev/null 2>&1 ; then
	sudo apt install -y wget > /dev/null 2>&1 && sleep 2
fi

if ! whiptail -v > /dev/null 2>&1; then
	sudo apt-get install -y whiptail > /dev/null 2>&1
fi

clear
sleep 1
echo -e "${BLUE}"
figlet -f slant "Toolbox"
echo -e "${YELLOW}================================================================${NC}"
echo -e "${GREEN}OS: Ubuntu 16/18/19/20, Debian 9/10 ${NC}"
echo -e "${GREEN}Created by: WantClue${NC}"
echo -e "${GREEN}Special thanks to hekopath ${NC}"
echo -e "${YELLOW}================================================================${NC}"
echo -e "${CYAN}1  - Installation of ThingsIX forwarder and mux${NC}"
echo -e "${CYAN}2  - Onboarding of ThingsIX Gateway${NC}"
echo -e "${CYAN}3  - Abort${NC}"
echo -e "${YELLOW}================================================================${NC}"

read -rp "Pick an option and hit ENTER: "
case "$REPLY" in
 1)  
		clear
		sleep 1
		install
 ;;
 2) 
		clear
		sleep 1
		onboard
 ;;
 3) 
		clear
		sleep 1
		exit
 ;;
esac
