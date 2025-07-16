#!/bin/bash

pkg update 
pkg install proot-distro -y 
proot-distro install ubuntu 
clear 
echo ✅ Successfully installed Trollos, please run . Thank you for using my script :D
proot-distro login ubuntu
