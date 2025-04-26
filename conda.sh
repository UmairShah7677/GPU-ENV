#!/bin/bash

# Step 1: Download Anaconda
echo "Downloading Anaconda installer..."
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh

# Step 2: Make the installer executable
echo "Making the Anaconda installer executable..."
chmod +x Anaconda3-2024.10-1-Linux-x86_64.sh

# Step 3: Run the Anaconda installer
echo "Installing Anaconda..."
sudo ./Anaconda3-2024.10-1-Linux-x86_64.sh -b -p /root/anaconda3

# Step 4: Initialize conda (to modify /root/.bashrc)
echo "Initializing Conda..."
sudo /root/anaconda3/bin/conda init

# Step 5: Source /root/.bashrc to apply changes
echo "Sourcing /root/.bashrc to apply changes..."
source /root/.bashrc
source ~/.bashrc
echo "Anaconda installation complete and Conda initialized!"
