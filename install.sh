#!/bin/sh

set -euxo pipefail

mkdir -p $HOME/.tmp

mkdir -p $HOME/.config/fish/
ln -sf $PWD/config.fish $HOME/.config/fish/config.fish

mkdir -p $HOME/.config/jj
ln -sf $PWD/jj-config.toml $HOME/.config/jj/config.toml

mkdir -p $HOME/.config/claude
ln -sf $PWD/AGENTS.toml $HOME/.config/claude/CLAUDE.md

ln -sf $PWD/tmux.conf $HOME/.tmux.conf
ln -sf $PWD/ripgreprc $HOME/.ripgreprc
ln -sfT $PWD/nvim $HOME/.config/nvim
ln -sfT $PWD/ghostty $HOME/.config/ghostty
