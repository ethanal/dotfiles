#!/bin/sh

mkdir -p $HOME/.tmp
touch local.zsh
# TODO: fix for nix
# mkdir -p ~/.oh-my-zsh/custom/themes
# ln -sf $PWD/ethan.zsh-theme $HOME/.oh-my-zsh/custom/themes/ethan.zsh-theme

ln -sf $PWD/zshrc.symlink $HOME/.zshrc
ln -sfT $PWD/nvim.symlink $HOME/.config/nvim
ln -sf $PWD/tmux.conf.symlink $HOME/.tmux.conf
ln -sf $PWD/pythonrc.symlink $HOME/.pythonrc
ln -sf $PWD/ripgreprc.symlink $HOME/.ripgreprc
