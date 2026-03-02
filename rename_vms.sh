#!/usr/bin/env bash

# Bash strict mode
set -euo pipefail

# Reads hostname from user
read -r -p "Enter new hostname: " NEWNAME

# Applies the hostname
sudo hostnamectl set-hostname "$NEWNAME"

# Persist in /etc/hostname
echo "$NEWNAME" | sudo tee /etc/hostname > /dev/null

# Insert NEWNAME as a new second line in /etc/hosts (bare line; see note below)
sudo sed -i "2i\\
127.0.1.1 $NEWNAME
" /etc/hosts


echo "Hostname updated to '$NEWNAME'."