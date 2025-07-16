#!/bin/bash

pkg update 
pkg install proot-distro -y 
proot-distro install ubuntu 
clear 
echo ✅ Successfully installed Troolos, please continue with the installation process. Thank you for using my script :D
proot-distro login ubuntu

echo "Welcome to Troll OS!"
echo "This OS Was Made By Tozter_1."
echo "Enjoy!"
echo
echo "Installation:"
echo "NOTICE: it installs actual settings you chose into the directory the script is in so u dont have to make the installation again."
echo

# Step 1
read -p "1. Username for new user: " userUsername

# Step 2
read -p "2. Password for new user (leave empty for no password login): " -s userPassword
echo

# Step 3
read -p "3. Username for root user: " rootUsername

# Step 4
while true; do
    read -p "4. Password for root user (required): " -s rootPassword
    echo
    if [[ -z "$rootPassword" ]]; then
        echo "Root password cannot be empty!"
    else
        break
    fi
done

# Step 5
while true; do
    read -p "5. Do you want the developers to spy on you? (yes/no): " spyConsent
    if [[ "$spyConsent" == "yes" || "$spyConsent" == "no" ]]; then
        break
    fi
done

# Save settings
cat > trollos_settings.txt <<EOF
Troll OS Settings
==================
User Username: $userUsername
User Password: ${userPassword:-No Password}
Root Username: $rootUsername
Root Password: $rootPassword
Spy Consent: $spyConsent
EOF

echo "✅ Settings saved to trollos_settings.txt"

# Optional Package Install
echo
read -p "Do you want to install basic tools (curl, git, htop, neofetch)? (y/n): " installTools
if [[ "$installTools" == "y" || "$installTools" == "Y" ]]; then
    if command -v apt >/dev/null 2>&1; then
        echo "Updating package list..."
        apt update

        echo "Installing packages..."
        apt install -y curl git htop neofetch 2>/dev/null

        echo "✅ Packages installed."

        # Optionally run neofetch
        if command -v neofetch >/dev/null 2>&1; then
            echo "Launching Neofetch..."
            neofetch
        else
            echo "⚠️ Neofetch was not found after install. Maybe something failed."
        fi
    else
        echo "❌ 'apt' not found. Your proot-distro may not support package installation."
    fi
else
    echo "⏩ Skipping package installation."
fi
