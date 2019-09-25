#!/bin/zsh

touch ~/.localrc

mkdir -p ~/.oh-my-zsh/custom/themes
ln -sf $PWD/ethan.zsh-theme $HOME/.oh-my-zsh/custom/themes/ethan.zsh-theme

ln -sf $PWD/zshrc.symlink $HOME/.zshrc
ln -sf $PWD/vim.symlink $HOME/.vim
ln -sf $PWD/tmux.conf.symlink $HOME/.tmux.conf
