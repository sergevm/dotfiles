#!/bin/bash

set -e

# Define theme repo
THEME_REPO="https://github.com/JannoTjarks/catppuccin-zsh.git"
THEME_DIR="$HOME/.oh-my-zsh/themes"
FLAVOR_DIR="$THEME_DIR/catppuccin-flavors"
THEME_FILE="$HOME/.oh-my-zsh/themes/catppuccin.zsh-theme"

if [ -f "$THEME_FILE" ]; then
  echo "Catppuccin theme for zsh is already installed."
  exit 0
fi

# Clone the theme repository
echo "Cloning Catppuccin theme for Oh My Zsh..."
git clone "$THEME_REPO" /tmp/catppuccin-zsh

# Create theme directories
mkdir -p "$FLAVOR_DIR"

# Move theme files
cp /tmp/catppuccin-zsh/catppuccin.zsh-theme "$THEME_DIR/"
cp /tmp/catppuccin-zsh/catppuccin-flavors/* "$FLAVOR_DIR/"

# Cleanup
rm -rf /tmp/catppuccin-zsh

echo "Catppuccin theme installed successfully. Restart your terminal to apply changes."
