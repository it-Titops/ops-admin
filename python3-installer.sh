#!/bin/bash

# In your docker container, you will need to configure dpkg
# Run this command and input the data as requested
# sudo dpkg --configure -a
# Once you are done with that, come back and run your script

# To run dpkg (behind other tools like Apt) without intera>
# you can set one environment variable as
export DEBIAN_FRONTEND=noninteractive

# Step 2: Install Supporting Software
sudo apt install -y software-properties-common

# Step 3: Install Python 3
sudo apt update && sudo apt install -y python3-pip

# Verify that the installation is a success
clear && python3 --version
sleep 3

echo "Installation Done"
sleep 2

