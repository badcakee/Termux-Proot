#!/bin/bash

if [ "$1" = "login" ] && [ -n "$2" ]; then
  if proot-distro login "$2"; then
    clear
    echo "✅ Successfully logged in"
  else
    clear
    echo "❌ Login failed"
  fi
else
  echo "Usage: btr login <distro>"
fi
