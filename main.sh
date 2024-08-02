#!/bin/bash

# Function to check for Python 3
check_python3() {
    if command -v python3 &>/dev/null; then
        echo "Python 3 is installed."
        return 0
    else
        echo "Python 3 is not installed."
        return 1
    fi
}

# Function to check for gdown
check_gdown() {
    if python3 -m pip show gdown &>/dev/null; then
        echo "gdown is installed."
        return 0
    else
        echo "gdown is not installed."
        return 1
    fi
}

# Function to install Python 3
install_python3() {
    echo "Installing Python 3..."
    if command -v apt-get &>/dev/null; then
        sudo apt-get update
        sudo apt-get install -y python3 python3-pip
    elif command -v yum &>/dev/null; then
        sudo yum install -y python3 python3-pip
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y python3 python3-pip
    else
        echo "Unsupported package manager. Please install Python 3 manually."
        exit 1
    fi
}

# Function to install gdown
install_gdown() {
    echo "Installing gdown..."
    python3 -m pip install gdown
}

# Function to download a file using gdown
download_file_gdrive() {
    read -p "Enter Google Drive link: " gdrive_id
    echo "Downloading file from Google Drive..."
    if ! gdown "$gdrive_id"; then
        echo "Failed to download the file."
        exit 1
    fi
    echo "Download completed successfully."
}

# Function to download a file from a direct link
download_file_direct() {
    read -p "Enter direct download link: " direct_link
    read -p "Enter the custom name for the downloaded file (with extension): " custom_filename
    echo "Downloading file from direct link..."
    if ! curl -L "$direct_link" -o "$custom_filename"; then
        echo "Failed to download the file."
        exit 1
    fi
    echo "Download completed successfully."
}

# Function to rename the downloaded file
rename_file() {
    read -p "Enter the current filename (with extension): " original_filename
    read -p "Enter the new filename (with extension): " new_filename
    if [ -f "$original_filename" ]; then
        mv "$original_filename" "$new_filename"
        echo "File renamed to $new_filename."
    else
        echo "File $original_filename does not exist."
        exit 1
    fi
}

# Function to upload the file to SourceForge
upload_file() {
    read -p "Enter the filename to upload: " upload_filename
    echo "Uploading $upload_filename to SourceForge..."
    scp "$upload_filename" mishrabiswajit6@frs.sourceforge.net:/home/frs/project/munch
    if [ $? -eq 0 ]; then
        echo "Upload successful."
    else
        echo "Upload failed."
        exit 1
    fi
}

# Main script logic
if ! check_python3; then
    install_python3
fi

if ! check_gdown; then
    install_gdown
fi

echo "Choose download method:"
echo "1. Download using Google Drive ID (gdown)"
echo "2. Download using a direct link (curl)"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        download_file_gdrive
        rename_file
        ;;
    2)
        download_file_direct
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

upload_file

echo "Setup complete."
