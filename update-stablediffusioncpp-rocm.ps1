######################################
#      stable-diffusion.cpp ROCM     #
######################################

Write-Host "🚀  Updating stable-diffusion.cpp compiled for the ROCm backend" -ForegroundColor Cyan

# Define repo and asset pattern
$Owner = "leejet"
$Repo = "stable-diffusion.cpp"
$AssetPattern = "bin-win-rocm-x64.zip"

# Base download directory
$DownloadDir = Join-Path $env:USERPROFILE "apps"

# Ensure base directory exists
if (-not (Test-Path $DownloadDir)) {
    New-Item -ItemType Directory -Path $DownloadDir | Out-Null
}

# Subfolder for extraction
$ExtractDir = Join-Path $DownloadDir "stablediffusioncpp-rocm"

# Create or clean extraction directory
if (Test-Path $ExtractDir) {
    Write-Host "Cleaning old files in $ExtractDir ..."
    Remove-Item -Recurse -Force -Path $ExtractDir\*
} else {
    New-Item -ItemType Directory -Path $ExtractDir | Out-Null
}

# GitHub API URL
$ApiUrl = "https://api.github.com/repos/$Owner/$Repo/releases/latest"
$Headers = @{ "User-Agent" = "powershell-script" }

# Fetch latest release info
$response = Invoke-RestMethod -Uri $ApiUrl -Headers $Headers

# Find the matching asset
$asset = $response.assets | Where-Object { $_.name -like "*$AssetPattern*" } | Select-Object -First 1

if (-not $asset) {
    Write-Error "Could not find asset matching pattern '$AssetPattern'."
    exit 1
}

# Prepare download
$Url = $asset.browser_download_url
$FileName = $asset.name
$ZipFile = Join-Path $DownloadDir $FileName

# Download ZIP
Write-Host "Downloading $FileName to $ZipFile ..."
Invoke-WebRequest -Uri $Url -OutFile $ZipFile -UseBasicParsing
Write-Host "Download complete."

# Extract ZIP
Write-Host "Extracting $FileName to $ExtractDir ..."
Expand-Archive -Path $ZipFile -DestinationPath $ExtractDir -Force
Write-Host "Extraction complete."

# Add to PATH if not already there
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($CurrentPath -notlike "*$ExtractDir*") {
    Write-Host "Adding $ExtractDir to user PATH ..."
    $NewPath = "$CurrentPath;$ExtractDir"
    [Environment]::SetEnvironmentVariable("Path", $NewPath, "User")
    Write-Host "PATH updated. You may need to open a new terminal for changes to take effect."
} else {
    Write-Host "$ExtractDir is already in PATH."
}

# (Optional) Remove the zip to save space
Remove-Item $ZipFile -Force

# Verify installation (assuming the binary is named 'llama-server.exe')
Write-Host "Verifying installation..."
& "$HOME\apps\stablediffusioncpp-rocm\sd-cli.exe" --version

Write-Host "✔️  Updating stable-diffusion.cpp compiled for the ROCm backend complete" -ForegroundColor Cyan