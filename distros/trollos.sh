#!/bin/bash

echo "Welcome to Troll OS!"
echo "This OS Was Made By Tozter_1."
echo "Enjoy!"
echo
echo "Installation:"
echo "NOTICE: it installs actual settings you chose into the directory the script is in so u dont have to make the installation again."
echo

read -p "1. Username for new user: " userUsername

read -p "2. Password for new user (leave empty for no password login): " -s userPassword
echo

read -p "3. Username for root user: " rootUsername

while true; do
    read -p "4. Password for root user (required): " -s rootPassword
    echo
    if [[ -z "$rootPassword" ]]; then
        echo "Root password cannot be empty!"
    else
        break
    fi
done

while true; do
    read -p "5. Do you want the developers to spy on you? (yes/no): " spyConsent
    if [[ "$spyConsent" == "yes" || "$spyConsent" == "no" ]]; then
        break
    fi
done

# Save to file
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

# Optional: Install packages
echo
read -p "Do you want to install basic tools (curl, git, htop)? (y/n): " installTools
if [[ "$installTools" == "y" || "$installTools" == "Y" ]]; then
    echo "Installing packages..."
    sudo apt update
    sudo apt install -y curl git htop
    echo "✅ Packages installed."
fi
