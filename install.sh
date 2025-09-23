#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

echo "Installing homebrew..."
./install_brew.sh

echo "Installing Oh My Zsh with plugins ..."
if [ ! -d "$HOME/.oh-my-zsh" ] ; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed"
fi
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ] ; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
  echo "powerlevel10k is already installed"
fi
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/catppuchin/zsh-syntax-highlighting" ] ; then
  git clone --depth=1 https://github.com/catppuccin/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/catppuchin/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting catppuccin theme is already installed"
fi
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] ; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
  echo "zsh-syntax-highlighting is already installed"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] ; then
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  echo "zsh-autosuggestions is already installed"
fi

echo "Installing catppuccin theme for zsh"
./install_oh_my_zsh_catppuccin_theme.sh

echo "Installling azure-cli..."
brew install azure-cli

echo "Installing NVM..."
brew install nvm

echo "Installing Neovim..."
brew install neovim

# Aerospace installation
# Note that when XDG_CONFIG_HOME is not set, it defaults to ~/.config, which is what the current configuration expects.
echo "Installing Aerospace..."
brew install --cask nikitabobko/tap/aerospace

echo "Installing Yazi..."
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font

echo "Installing Lazygit..."
brew install lazygit

echo "Installing zoxide..."
brew install zoxide

echo "Installing tmux..."
brew install tmux
if [ ! -d "$XDG_CONFIG_HOME/tmux/plugins/catppuccin/tmux" ] ; then
  git clone -b v2.1.3 https://github.com/catppuccin/tmux.git $XDG_CONFIG_HOME/tmux/plugins/catppuccin/tmux
fi
if [ ! -d "~/.tmux/plugins/tpm" ] ; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins
tmux source-file ~/.tmux.conf
fi

echo "Installing stow..."
brew install stow

echo "Installing git credential manager..."
brew install --cask git-credential-manager
