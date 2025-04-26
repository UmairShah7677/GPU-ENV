#!/bin/bash

# Step 1: Download cuDNN package
echo "Downloading cuDNN package..."
wget https://developer.download.nvidia.com/compute/cudnn/9.8.0/local_installers/cudnn-local-repo-ubuntu2404-9.8.0_1.0-1_amd64.deb

# Step 2: Install the cuDNN package
echo "Installing cuDNN package..."
sudo dpkg -i cudnn-local-repo-ubuntu2404-9.8.0_1.0-1_amd64.deb

# Step 3: Copy the keyring file to the appropriate directory
echo "Copying keyring for cuDNN repository..."
sudo cp /var/cudnn-local-repo-ubuntu2404-9.8.0/cudnn-*-keyring.gpg /usr/share/keyrings/

# Step 4: Update package lists
echo "Updating apt package lists..."
sudo apt-get update

# Step 5: Install cuDNN
echo "Installing cuDNN..."
sudo apt-get -y install cudnn
sudo apt install nvidia-cuda-toolkit

# Step 6: Modify .bashrc to add CUDA paths
echo "Adding CUDA paths to ~/.bashrc..."
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

# Step 7: Source the .bashrc file to apply the changes
echo "Sourcing ~/.bashrc..."
source ~/.bashrc

echo "CUDA and cuDNN installation complete!"
