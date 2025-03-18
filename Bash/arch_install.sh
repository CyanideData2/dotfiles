#!/bin/bash

mkdir -p ~/.config/ 
pushd ~/V/Workspace/my_config
find -maxdepth 1 -mindepth 1 | while read file; do
	rm -r  ~/.config/$file
	ln -s ~/V/Workspace/my_config/$file ~/.config/$file
done

popd
mkdir -p ~/Pictures/Screenshots

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru -S metapac
metapac sync base
metapac sync dev
metapac sync hyprland
