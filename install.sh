#!/bin/bash

sudo dnf install git stow curl gcc -y

sh <(curl -L https://nixos.org/nix/install) --no-daemon

source /home/sfrick/.nix-profile/etc/profile.d/nix.sh

NIXPKGS_ALLOW_UNFREE=1 nix-env -iA \
	nixpkgs.neovim \
	nixpkgs.google-chrome \
	nixpkgs.spotify \
	nixpkgs.tmux \
	nixpkgs.tmuxinator \
	nixpkgs.grim \
	nixpkgs.wlogout \
	nixpkgs.rofi \
	nixpkgs.waybar \
	nixpkgs.neofetch \
	nixpkgs.python311 \
	nixpkgs.python311Packages.pip \
	nixpkgs.rustup

rustup default stable

stow *
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install --lts
nvm use --lts

# SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) -y

stow -R *
