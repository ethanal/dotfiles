if command -v nvim > /dev/null; then
  alias vim=nvim
fi

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

  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
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
alias kdp="kubectl describe pod"
alias kgn="kubectl get nodes"
alias kc=kubectx
alias kns=kubens

jl() {
  jq -r -R '. as $raw | try fromjson catch $raw'
}

jj-watch () {
  watch -n 1 --color jj --color=always --ignore-working-copy
}

jj-sync() {(
  set -euo pipefail
  DEFAULT_BRANCH=$(jj log -r "local_trunk()" -T "local_bookmarks.filter(|b| b.name() == 'master' || b.name() == 'main' || b.name() == 'trunk')" --no-pager --no-graph --color=never)
  set -x
  jj git fetch -b $DEFAULT_BRANCH -b "glob:$USER/*"
  jj bookmark set $DEFAULT_BRANCH --to "trunk()"
)}

jj-restack() {(
  set -euxo pipefail
  jj rebase -b "all:(mine() & local_trunk()..)" -d "trunk()" --skip-emptied
)}

jj-submit-all() {(
  set -euo pipefail

  for CHANGE_ID in $(jj log -r "mine() & trunk().. & bookmarks(glob:'$USER/*')" --no-pager --no-graph --color=never -T 'change_id ++ "\n"'); do
    echo Submitting $CHANGE_ID...
    jj-submit $CHANGE_ID
    echo
  done
)}

jj-submit() {(
  set -euo pipefail

  COMMIT=$1;
  CHANGE_ID="$(jj log --template 'change_id.shortest(8)' --no-pager --no-graph --color=never -r $COMMIT)"
  BRANCH_NAME="$USER/$(jj log --template 'change_id.shortest(8)' --no-pager --no-graph --color=never -r $CHANGE_ID)"

  MQ_CHANGE_ID=$(jj log -T 'if(parents.len() == 1, parents.map(|p| p.change_id()))' -r $COMMIT --no-pager --no-graph --color=never)
  MQ_BRANCH_NAME="mq/$CHANGE_ID"

  set -x
  jj bookmark set $BRANCH_NAME -r $CHANGE_ID
  jj bookmark set $MQ_BRANCH_NAME -r $MQ_CHANGE_ID

  jj git push -b exact:$MQ_BRANCH_NAME --allow-new
  jj git push -b exact:$BRANCH_NAME --allow-new
  set +x
  if [[ "$(gh pr list --head $BRANCH_NAME --json number)" == "[]" ]]; then
    echo Creating PR...
    gh pr create --head $BRANCH_NAME --base $MQ_BRANCH_NAME
  else
    # Reset the base. Seems to be necessary to get the PR to update.
    echo Updating PR...
    gh pr edit $BRANCH_NAME --base $MQ_BRANCH_NAME
  fi

  PR_NUMBER=$(gh pr list --head $BRANCH_NAME --json number | jq ".[] | .number")

  # Build PR comment.
  LOG=$(jj log -r "(trunk()::$CHANGE_ID | $CHANGE_ID::) & remote_bookmarks(glob:'$USER/*')" --no-pager --color=never -T "description.first_line() ++ ' REPLACE_BRANCH_NAME:' ++ remote_bookmarks.filter(|b| b.name().starts_with('$USER/') && b.remote() == 'git').map(|b| b.name())")
  echo $LOG | grep -o 'REPLACE_BRANCH_NAME.\+' | while read -r PATTERN; do
    STK_BRANCH_NAME=$(echo $PATTERN | sed -E 's/REPLACE_BRANCH_NAME:(.*)/\1/')
    PR_URL="<a href='$(gh pr view $STK_BRANCH_NAME --json url --template "{{ .url }}")'>#$PR_NUMBER</a>"
    PATTERN_ESCAPE=$(echo $PATTERN | sed -E 's/\//\\\//g')
    PR_URL_ESCAPE=$(echo $PR_URL | sed -E 's/\//\\\//g')

    SUFFIX=""
    if [[ $STK_BRANCH_NAME == $BRANCH_NAME ]]; then
      SUFFIX=" 👈"
    fi
    LOG=$(echo $LOG | sed -E "s/$PATTERN_ESCAPE/$PR_URL_ESCAPE$SUFFIX/g")
  done

  COMMENT_FILE=$(mktemp)
  echo "### 🥞 Pull Request Stack" >> $COMMENT_FILE
  echo '<pre>' >> $COMMENT_FILE
  echo $LOG >> $COMMENT_FILE
  echo '</pre>' >> $COMMENT_FILE
  # echo $LOG | sed -E 's/.+/<samp>&<\/samp>/g' >> $COMMENT_FILE
  echo "<!-- this_is_the_jj_pr_stack_comment -->" >> $COMMENT_FILE

  # Create or update PR comment.
  OWNER_REPO=$(gh repo view --json owner,name --template "{{ .owner.login }}/{{ .name }}")
  EXISTING_COMMENT=$(gh api --method GET repos/${OWNER_REPO}/issues/${PR_NUMBER}/comments | jq '.[] | select(.body | contains("this_is_the_jj_pr_stack_comment")) | .id')
  if [[ -n $EXISTING_COMMENT ]]; then
    gh api --method PATCH repos/${OWNER_REPO}/issues/comments/${EXISTING_COMMENT} -F body=@$COMMENT_FILE --silent
  else
    gh pr comment $PR_NUMBER --body-file $COMMENT_FILE > /dev/null
  fi

  rm $COMMENT_FILE
)}

