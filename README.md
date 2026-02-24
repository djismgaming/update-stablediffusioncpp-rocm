# update-llamacpp-rocm

This repository contains a PowerShell script (`update-llamacpp-rocm.ps1`) that automates downloading and installing the latest Windows ROCm‑enabled binaries of **llama.cpp** from GitHub.

## Features

- Downloads the most recent `bin-win-rocm-x64.zip` release from `https://github.com/ggml-org/llama.cpp/releases/latest`.
- Extracts the archive into a dedicated folder under `C:\Users\<User>\apps\llamacpp-rocm`.
- Adds that folder to the user’s `PATH` automatically.
- Cleans any previous installation before extracting the new files.
- Verifies the installation by running `llama-server.exe --version`.

## Environment this is used on

- AMD Ryzen 5 5600X
- AMD Radeon RX 6800 16GB (Reference design by Sapphire)
- 32 GB DDR4 - 3600 MHz

## Prerequisites

- Windows 10/11
- PowerShell 5.1+ (built‑in PowerShell or PowerShell Core)
- An internet connection

## Installation

1. Open PowerShell (no administrative privileges required).

2. Run the script:

   ```powershell
   .\update-llamacpp-rocm.ps1
   ```

3. The script will:

   1. Creates the base directory `C:\Users\<username>\apps\` if it doesn't exist
   2. Creates or cleans the subdirectory `C:\Users\<username>\apps\llamacpp-rocm\`
   3. Downloads the latest `bin-win-rocm-x64.zip` from GitHub
   4. Extracts the contents to the llamacpp-rocm folder
   5. Adds this folder to the user's PATH
   6. Verifies installation by running `llama-server.exe --version`

4. After the script completes, you can launch `llama-server.exe` from any terminal without providing a full path.

> **Tip**  
> If you open a new PowerShell window after running the script, the updated `PATH` will be available immediately.

## Contributing

Pull requests and issue reports are welcome. Feel free to suggest enhancements, bug fixes, or additional documentation.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.