#!/bin/sh

mkdir -p $HOME/.tmp

ln -sf $PWD/config.fish.symlink $HOME/.config/fish/config.fish
ln -sfT $PWD/nvim.symlink $HOME/.config/nvim
ln -sf $PWD/tmux.conf.symlink $HOME/.tmux.conf
ln -sf $PWD/ripgreprc.symlink $HOME/.ripgreprc
