#!/bin/sh

set -euxo pipefail

mkdir -p $HOME/.tmp

mkdir -p $HOME/.config/fish/
ln -sf $PWD/config.fish $HOME/.config/fish/config.fish

mkdir -p $HOME/.config/jj
ln -sf $PWD/jj-config.toml $HOME/.config/jj/config.toml

mkdir -p $HOME/.claude
ln -sf $PWD/AGENTS.md $HOME/.claude/CLAUDE.md
ln -sf $PWD/AGENTS.md $HOME/.config/AGENTS.md

ln -sf $PWD/tmux.conf $HOME/.tmux.conf
ln -sf $PWD/ripgreprc $HOME/.ripgreprc
ln -sfT $PWD/nvim $HOME/.config/nvim
ln -sfT $PWD/ghostty $HOME/.config/ghostty

fetch_with_hash() {
  url="$1"
  dest="$2"
  hash="$3"
  if [ -f "$dest" ] && echo "$hash  $dest" | sha256sum --check --status; then
    return
  fi
  wget -O "$dest" "$url"
  echo "$hash  $dest" | sha256sum --check
}

fetch_with_hash https://github.com/hiasr/vim-zellij-navigator/releases/download/0.3.0/vim-zellij-navigator.wasm zellij/plugins/vim-zellij-navigator.wasm 77e5a2f62f7c1a698caf2574493d5d75587e0fd877cfba34c48caf731c24c58d

fetch_with_hash https://github.com/dj95/zjstatus/releases/download/v0.23.0/zjstatus.wasm zellij/plugins/zjstatus.wasm e006901223524239db618021e4cc5d17f82dc4bfae5432895ba41f03f13861ff

ln -sfT $PWD/zellij $HOME/.config/zellij
