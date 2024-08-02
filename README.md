# File Download and Upload Script

## Overview

This script provides a convenient way to download files from Google Drive or direct links, rename the downloaded file, and then upload it to SourceForge. It handles the installation of Python 3 and the `gdown` tool if they are not already installed on the system.

## Features

- **Check for Python 3 and `gdown`**: Verifies if Python 3 and the `gdown` package are installed.
- **Install Python 3**: Installs Python 3 and pip using appropriate package managers.
- **Install `gdown`**: Installs the `gdown` package if not present.
- **Download File**:
  - From Google Drive using `gdown`.
  - From a direct link using `curl`.
- **Rename File**: Allows renaming of the downloaded file.
- **Upload File**: Uploads the file to SourceForge via `scp`.

## Prerequisites

- Linux-based system (e.g., Ubuntu, CentOS, Fedora).
- `apt-get`, `yum`, or `dnf` package manager for installing Python 3.
- `scp` for uploading files to SourceForge.

## Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/mishrabiswajit/rom-uploader.git && cd rom-uploader
    ```

2. **Make the Script Executable**:
    ```bash
    chmod +x main.sh
    ```

## Usage

1. **Run the Script**:
    ```bash
    ./main.sh
    ```

2. **Follow the Prompts**:
    - Choose between downloading from Google Drive or a direct link.
    - Enter the required information (e.g., file names, download links).
    - The script will handle the download, renaming, and upload process.

## Example

1. **Download a File from Google Drive**:
    - Choose option `1` when prompted.
    - Enter the Google Drive link.
    - Rename the file if needed.
    - Upload the file to SourceForge.

2. **Download a File from a Direct Link**:
    - Choose option `2` when prompted.
    - Enter the direct download link and specify the custom filename.
    - Upload the file to SourceForge.

## Repository Name Suggestion

**`file-download-upload-script`**

Feel free to change it according to your preferences.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [gdown](https://github.com/wrapp/gdown) for Google Drive file downloads.
- [curl](https://curl.se/) for direct file downloads.
- [SourceForge](https://sourceforge.net/) for file hosting.