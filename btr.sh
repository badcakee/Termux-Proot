#!/bin/bash

if [ "$1" = "login" ] && [ -n "$2" ]; then
  proot-distro login "$2"
else
  echo "Usage: btr login <distro>"
fi
