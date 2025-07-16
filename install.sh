#!/bin/bash

echo "Updating packages..."
pkg update

echo "Installing BTR..."
mkdir -p ~/bin
curl -fsSL https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/btr.sh -o ~/bin/btr
chmod +x ~/bin/btr
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
export PATH=$HOME/bin:$PATH

echo "Choose a distro:"
echo "1) Debian"
echo "2) Ubuntu"
echo "3) Adelie"
echo "4) Alpine"
echo "5) Archlinux"
echo "6) Chimera"
echo "7) Deepin"
echo "8) Fedora"
echo "9) Manjaro"
echo "10) Opensuse"
echo "11) Pardus"
echo "12) Rockylinux"
echo "13) Void"
echo "14) Trollos (might not work)"
read -p "Enter a number (1-14): " choice

case $choice in
  1) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/debian.sh) ;;
  2) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/ubuntu.sh) ;;
  3) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/adelie.sh) ;;
  4) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/alpine.sh) ;;
  5) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/archlinux.sh) ;;
  6) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/chimera.sh) ;;
  7) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/deepin.sh) ;;
  8) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/fedora.sh) ;;
  9) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/manjaro.sh) ;;
  10) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/opensuse.sh) ;;
  11) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/pardus.sh) ;;
  12) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/rockylinux.sh) ;;
  13) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/void.sh) ;;
  14) bash <(curl -s https://raw.githubusercontent.com/badcakee/Termux-Root/refs/heads/main/distros/trollosinstall.sh) ;;
  *) echo "Invalid choice. Please enter a number from 1 to 14." ;;
esac
