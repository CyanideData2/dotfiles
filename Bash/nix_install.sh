#!/bin/bash

pushd ~/V/Workspace/my_config
find -maxdepth 1 -mindepth 1 | while read file; do
	rm -r  ~/.config/$file
	ln -s ~/V/Workspace/my_config/$file ~/.config/$file
done

popd


mkdir -p ~/Pictures/Screenshots
