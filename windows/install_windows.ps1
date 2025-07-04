<#
.SYNOPSIS
    A robust PowerShell script to install multiple applications using winget.
.DESCRIPTION
    This script checks for Administrator privileges, then iterates through a predefined
    list of winget package IDs. It attempts to install each one silently and reports
    on the success or failure of each installation, providing a final summary.
.NOTES
    Author: Your Name
    Date:   October 26, 2023
#>

# ===================================================================
#                            CONFIGURATION
# ===================================================================
# Add the exact Package IDs of the software you want to install.
# To find a package ID, use the command: winget search "AppName"
$packages = @(
    # --- Developer Tools ---
    "Microsoft.PowerToys",
    "Google.Chrome",
    "Mozilla.Firefox",
    "Notepad++.Notepad++",
    # "WinSCP.WinSCP",
    "JanDeDobbeleer.OhMyPosh",
    "Debian.Debian",
    "Neovim.Neovim"

    # ---- better installed manually ---
    # "Git.Git",
    # "Docker.DockerDesktop",
    # "Microsoft.VisualStudioCode",
    # "CondaForge.Miniforge3"

    # --- Utilities ---
    "ShareX.ShareX",
    "voidtools.Everything",
    "Bandisoft.Bandizip",
    "PeterPawlowski.foobar2000",
    "Daum.PotPlayer",
    "IrfanSkiljan.IrfanView",
    "AutoHotkey.AutoHotkey",
    "TrackerSoftware.PDF-XChangeEditor",
    "KeePassXCTeam.KeePassXC",
    "Google.Drive",
    "Piriform.CCleaner",
    "Adobe.Acrobat.Reader.64-bit",
    "Kakao.KakaoTalk"


    # --- Productivity & Media ---
    "Obsidian.Obsidian",
    "yt-dlp.yt-dlp"
    
)

# ===================================================================
#                         SCRIPT EXECUTION
# ===================================================================

# --- 1. PRE-RUN CHECKS ---

# Check if running as Administrator, which is required for many installers.
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Administrator privileges are required to install software."
    Write-Warning "Please re-run this script from a PowerShell session with 'Run as Administrator'."
    # Pause for 10 seconds before exiting so the user can read the message.
    Start-Sleep -Seconds 10
    Exit
}

# Check if winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "Winget command not found. Please ensure Winget is installed and accessible in your PATH."
    Start-Sleep -Seconds 10
    Exit
}


# --- 2. INSTALLATION PROCESS ---

## For oh-my-posh
New-Item -Path $PROFILE -Type File -Force

# z command on powershell (https://github.com/badmotorfinger/z)
PowerShellGet\Install-Module z -Scope CurrentUser -Force -AllowClobber

# syntax highlighting (https://github.com/digitalguy99/pwsh-syntax-highlighting)
Install-Module syntax-highlighting

### Winget section ####

Write-Host "Starting bulk package installation using winget..." -ForegroundColor Cyan
Write-Host "Found $($packages.Count) packages to process."

$successCount = 0
$failureCount = 0
$failedPackages = [System.Collections.ArrayList]@()

foreach ($packageId in $packages) {
    Write-Host "--------------------------------------------------"
    Write-Host "Processing package: $packageId" -ForegroundColor Yellow

    # Check if the package is already installed
    $installed = winget list --id $packageId -n 1
    if ($installed) {
        Write-Host "Package '$packageId' is already installed. Skipping." -ForegroundColor Gray
        continue # Skip to the next package in the loop
    }
    
    # Run the installation command
    Write-Host "Installing '$packageId'..."
    winget install --id $packageId --silent --accept-package-agreements --accept-source-agreements

    # Check the exit code of the last command
    if ($LASTEXITCODE -eq 0) {
        Write-Host "SUCCESS: '$packageId' installed successfully." -ForegroundColor Green
        $successCount++
    } else {
        Write-Warning "FAILURE: Failed to install '$packageId'. Winget exit code: $LASTEXITCODE"
        $failureCount++
        [void]$failedPackages.Add($packageId)
    }
}


# --- 3. FINAL SUMMARY ---

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "            Installation Summary" -ForegroundColor Cyan
Write-Host "=================================================="
Write-Host "Successfully installed: $successCount package(s)." -ForegroundColor Green
Write-Host "Failed to install:    $failureCount package(s)." -ForegroundColor Red

if ($failureCount -gt 0) {
    Write-Host "The following packages failed to install:" -ForegroundColor Red
    $failedPackages | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
}

Write-Host "Script execution finished."
