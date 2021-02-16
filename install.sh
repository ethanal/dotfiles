#!/bin/sh

mkdir -p $HOME/.tmp
touch local.zsh
mkdir -p ~/.oh-my-zsh/custom/themes
ln -sf $PWD/ethan.zsh-theme $HOME/.oh-my-zsh/custom/themes/ethan.zsh-theme

ln -sf $PWD/zshrc.symlink $HOME/.zshrc
ln -sfT $PWD/vim.symlink $HOME/.vim
ln -sf $PWD/tmux.conf.symlink $HOME/.tmux.conf
ln -sf $PWD/pythonrc.symlink $HOME/.pythonrc
