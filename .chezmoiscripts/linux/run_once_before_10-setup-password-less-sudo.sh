#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

USER_NAME=$(whoami)
SUDOERS_FILE="/etc/sudoers.d/$USER_NAME"

# Check if the sudoers file for this user already exists
if [ ! -f "$SUDOERS_FILE" ]; then
    echo "Setting up passwordless sudo for $USER_NAME..."
    
    # We use sudo here, so it will prompt for your password ONE last time
    echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" | sudo tee "$SUDOERS_FILE" > /dev/null
    
    # Sudoers files must have strict permissions
    sudo chmod 0440 "$SUDOERS_FILE"
    
    echo "Passwordless sudo configured successfully."
else
    echo "Passwordless sudo is already configured for $USER_NAME."
fi
