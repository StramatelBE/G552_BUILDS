#!/bin/bash
clear


GITHUB_REPOSITORY=https://github.com/StramatelBE/G552_BUILDS.git
WORKDIR=server_builds

# Initialize progress
TOTAL_STEPS=7
CURRENT_STEP=-1

function print_progress {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    PERCENT=$(( (CURRENT_STEP * 100) / TOTAL_STEPS ))
    echo -ne "Progress: ["
    for ((i = 0; i < (PERCENT / 10); i++)); do echo -ne "\033[33m#\033[0m"; done
    for ((i = (PERCENT / 10); i < 10; i++)); do echo -ne "\033[31m-\033[0m"; done
    echo -e "] \033[32m $PERCENT\033[0m% - \033[36m $1 \033[0m \r"
    sleep 1 # Simulating time taken for the step
}

#SOFTWARE UPDATE
print_progress "Updating software packages..."
echo -e "Starting \033[35m setup \033[0m process..."
sudo apt update -y
sudo apt upgrade -y
clear

#BASIC UTILITIES
print_progress "Installing basic utilities...        "
sudo apt install -y vim curl wget git zip
clear

#CLONE REPOSITORY
print_progress "Cloning repository...               "
cd ~
git clone $GITHUB_REPOSITORY $WORKDIR
clear

#NODE INSTALL
print_progress "Installing Node.js...               "
bash ~/$WORKDIR/scripts/setup/node_install.sh
clear
npm install -g serve 
clear

#GETTING CURRENT VERSION
VERSION=$(cat ~/$WORKDIR/builds/selected_version)
BUILD_FILE=G552_BUILD_$VERSION.zip
#UNZIPPING 
print_progress "Unzipping...                      "
echo "WORKDIR : $WORKDIR"
echo "G552 Version : $SELECTED_VERSION"
echo "File : $BUILD_FILE"
unzip ~/$WORKDIR/$SELECTED_VERSION/$BUILD_FILE 
clear

#RUN
print_progress "Running application...              "
bash ~/$WORKDIR/scripts/run/run.sh 
clear

#SERVICE
print_progress "Initializing services...            "
# bash ~/$WORKDIR/scripts/services/services_init.sh
clear

#FINISHING
print_progress "Installation complete !            "


echo -ne '\n'
echo -e "\033[34m#\033[0m#\033[31m# \033[34mPROJECT \033[0m SUCCESSFULLY \033[31m INITIALIZED \033[0m \033[34m#\033[0m#\033[31m#"

echo -ne '\n'
echo -e "Do you want to reboot now? (Y/n) The system will automatically reboot in 30 seconds if no input is provided: "

# Start a background process for the countdown
{
    for ((i=30; i>0; i--)); do
        sleep 1 &
        printf "\rRebooting in $i seconds... Press 'n' to cancel.    "
        wait
    done
    echo -e "\nRebooting now..."
    sudo reboot
} &

# Wait for user input in the foreground and cancel the background job if 'n' is pressed
read -t 30 user_input
if [[ $user_input =~ ^[Nn]$ ]]; then
    # Kill the background job (the countdown and automatic reboot)
    kill $!
    echo -e "\nReboot cancelled."
fi
