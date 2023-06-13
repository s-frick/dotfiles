#!/bin/bash

sudo dnf install git stow curl

sh <(curl -L https://nixos.org/nix/install) --no-daemon

. /home/sfrick/.nix-profile/etc/profile.d/nix.sh

NIXPKGS_ALLOW_UNFREE=1 nix-env -iA \
	nixpkgs.google-chrome \
	nixpkgs.spotify \
	nixpkgs.tmux \
	nixpkgs.tmuxinator \
	nixpkgs.grim \
	nixpkgs.wlogout \
	nixpkgs.rofi \
	nixpkgs.waybar \
	nixpkgs.neofetch \
	nixpkgs.fnm \
	nixpkgs.python311 \
	nixpkgs.python311Packages.pip
	nixpkgs.nvm \
	nixpkgs.rustup

fnm install 16
rustup default stable
