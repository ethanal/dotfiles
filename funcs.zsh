alias gitprune="git remote prune origin"

alias dockerrmdangling="docker images --filter 'dangling=true' -q | xargs docker rmi"

alias pg="gist -pc"
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy | echo 'Public key copied to pasteboard.'"

# If the last character of the alias value is a blank, then the next command
# word following the alias is also checked for alias expansion. This makes sudo
# work correctly with aliases.
alias sudo='sudo '

alias gack='ack --ignore-dir=vendor --ignore-dir=testdata --ignore-dir=mocks'
alias gt='go test ./...'

who-listen() {
  lsof -t -i :$1
}

# OSX only.
if [ $(uname -s) = "Darwin" ]
then
  alias fixau=sudo killall -9 appleeventsd
  alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
  alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
  alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

  # This makes open work in tmux.
  alias open="reattach-to-user-namespace open"
fi


notes() {
  base=$HOME/notes
  dirname=$base/$(date +'%Y/%m-%b')
  filename=$(date +'%b-%d-%Y.md')
  mkdir -p $dirname
  cd $base
  vim $dirname/$filename
}

gitclose() {
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  (git checkout master || git checkout main || git checkout prod) && git pull && git branch -d $BRANCH
}


# K8s
alias k=kubectl
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kc=kubectx
alias kns=kubens

alias gpt=/usr/local/bin/gt
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

jl() {
  grep "^{" | jq -R 'fromjson?'
}
