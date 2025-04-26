#!/bin/bash

# Step 1: Download the CUDA pin file
echo "Downloading CUDA pin file..."
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-ubuntu2404.pin

# Step 2: Move the CUDA pin file to the preferences directory
echo "Moving the CUDA pin file..."
sudo mv cuda-ubuntu2404.pin /etc/apt/preferences.d/cuda-repository-pin-600

# Step 3: Download the CUDA installer package
echo "Downloading CUDA installer package..."
wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-ubuntu2404-12-8-local_12.8.1-570.124.06-1_amd64.deb

# Step 4: Install the CUDA package
echo "Installing CUDA package..."
sudo dpkg -i cuda-repo-ubuntu2404-12-8-local_12.8.1-570.124.06-1_amd64.deb

# Step 5: Copy the CUDA keyring to the correct directory
echo "Copying CUDA keyring..."
sudo cp /var/cuda-repo-ubuntu2404-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/

# Step 6: Update package lists
echo "Updating apt package lists..."
sudo apt-get update

# Step 7: Install the CUDA Toolkit 12.8
echo "Installing CUDA Toolkit 12.8..."
sudo apt-get -y install cuda-toolkit-12-8

# Step 8: Install CUDA drivers
echo "Installing CUDA drivers..."
sudo apt-get install -y cuda-drivers

echo "CUDA Toolkit and drivers installation complete!"

echo "====You can reboot the system now===="
