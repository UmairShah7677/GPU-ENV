# Installation Guide for Anaconda, CUDA, cuDNN, and CUDA Toolkit on Ubuntu 24.04

This guide provides detailed instructions for installing **Anaconda**, **CUDA**, **cuDNN**, and the **CUDA Toolkit** on an Ubuntu 24.04 system.

## Prerequisites
- A clean installation of Ubuntu 24.04.
- Root (administrator) access to the system.

## Step 1: Install Anaconda

1. **Download and Install Anaconda**:
    - This script will download the Anaconda installer, make it executable, and install it in the root directory (`/root/anaconda3`).
    - It also initializes Conda and updates `.bashrc`.

    **Installation Script**:

    ```bash
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
    
    echo "Anaconda installation complete and Conda initialized!"
    ```

    **Run the script**:
    
    ```bash
    sudo bash install_anaconda_root.sh
    ```

## Step 2: Install CUDA and cuDNN

1. **Download and Install cuDNN**:
    - This script will download and install cuDNN in Ubuntu 24.04. It sets up the necessary keyring, updates the package list, and installs the cuDNN library.

    **Installation Script**:

    ```bash
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
    
    # Step 6: Modify .bashrc to add CUDA paths
    echo "Adding CUDA paths to ~/.bashrc..."
    echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
    echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
    
    # Step 7: Source the .bashrc file to apply the changes
    echo "Sourcing ~/.bashrc..."
    source ~/.bashrc
    
    echo "CUDA and cuDNN installation complete!"
    ```

    **Run the script**:

    ```bash
    sudo bash install_cuda_cudnn.sh
    ```

## Step 3: Install CUDA Toolkit and Drivers

1. **Download and Install CUDA**:
    - This script will download the necessary `.deb` package for CUDA, install it, and configure the CUDA keyring and preferences.

    **Installation Script**:

    ```bash
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
    ```

    **Run the script**:

    ```bash
    sudo bash install_cuda_toolkit.sh
    ```

## Conclusion

After following these steps and running the provided scripts, you will have **Anaconda**, **CUDA**, **cuDNN**, and the **CUDA Toolkit** installed and configured on your Ubuntu 24.04 system.

If you run into any issues, feel free to reach out for assistance!

---
This guide was created to streamline the installation process and ensure you have all necessary dependencies for CUDA-based applications on Ubuntu 24.04.
