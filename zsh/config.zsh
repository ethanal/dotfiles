export CLICOLOR=true
export DISABLE_AUTO_TITLE=true
export HISTFILESIZE=200000
export HISTSIZE=10000
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
unsetopt sharehistory

export COWPATH=$HOME/.dotfiles/term/cows:/usr/local/share/cows
