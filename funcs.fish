# Fish shell functions and aliases
# Converted from funcs.zsh

# Vim wrapper function
if command -v nvim > /dev/null
    function vim
        if test -e (pwd)/.vim-server.pipe
            echo "Vim server already running in this directory. Running without server."
            sleep 1
            nvim $argv
        else
            nvim --listen (pwd)/.vim-server.pipe $argv
        end
    end
end

alias gitprune="git remote prune origin"

alias dockerrmdangling="docker images --filter 'dangling=true' -q | xargs docker rmi"

alias pg="gist -pc"
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Public key copied to pasteboard.'"

alias gt='go test ./...'

alias llm="uvx --with llm-anthropic llm -m claude-3.5-sonnet"

# macOS-specific aliases
if test (uname -s) = "Darwin"
    alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

    # This makes open work in tmux
    alias open="reattach-to-user-namespace open"

    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end

function notes
    set base $HOME/notes
    set dirname $base/(date +'%Y/%m-%b')
    set filename (date +'%b-%d-%Y.md')
    mkdir -p $dirname
    cd $base
    vim $dirname/$filename
end

alias k=kubectl
alias kgp="kubectl get pods"
alias kdp="kubectl describe pod"
alias kgn="kubectl get nodes"
alias kc=kubectx
alias kns=kubens

function check
    clear
    tmux clear-history
    cargo check --tests $argv
end

alias j=jj

function jl
    jq -r -R '. as $raw | try fromjson catch $raw'
end

function jj-watch
    watch -t -n 1 --color --no-wrap jj --color=always --ignore-working-copy
end

function jj-sync
    set DEFAULT_BRANCH (jj log -r "local_trunk()" -T "local_bookmarks.filter(|b| b.name() == 'master' || b.name() == 'main' || b.name() == 'trunk')" --no-pager --no-graph --color=never)
    set -x
    jj git fetch -b $DEFAULT_BRANCH -b "glob:$USER/*"
    jj bookmark set $DEFAULT_BRANCH --to "trunk()"
end

function jj-restack
    jj rebase -b "all:(mine() & local_trunk()..)" -d "trunk()" --skip-emptied
end

function jj-submit-all
    if test (count $argv) -eq 0
        set REVSET "all()"
    else
        set REVSET $argv[1]
    end

    for CHANGE_ID in (jj log -r "mine() & trunk().. & bookmarks(glob:'$USER/*') & $REVSET" --no-pager --no-graph --color=never -T 'change_id ++ "\n"')
        echo Submitting $CHANGE_ID...
        jj-submit $CHANGE_ID
        echo
    end
end

function jj-submit
    if test (jj bookmark list --conflicted)
        echo "Conflicted bookmarks detected. Resolve conflicts and try again."
        return 1
    end

    set COMMIT $argv[1]
    set CHANGE_ID (jj log --template 'change_id.shortest(8)' --no-pager --no-graph --color=never -r $COMMIT)
    set BRANCH_NAME "$USER/"(jj log --template 'change_id.shortest(8)' --no-pager --no-graph --color=never -r $CHANGE_ID)

    set MQ_CHANGE_ID (jj log -T 'if(parents.len() == 1, parents.map(|p| p.change_id()))' -r $COMMIT --no-pager --no-graph --color=never)
    set MQ_BRANCH_NAME "mq/$CHANGE_ID"

    set -x
    jj bookmark set $BRANCH_NAME -r $CHANGE_ID
    jj bookmark set $MQ_BRANCH_NAME -r $MQ_CHANGE_ID --allow-backwards

    jj git push -b glob:"*/$CHANGE_ID" --allow-new

    set +x
    if test (gh pr list --head $BRANCH_NAME --json number) = "[]"
        echo Creating PR...
        gh pr create --head $BRANCH_NAME --base $MQ_BRANCH_NAME
    else
        # Reset the base. Seems to be necessary to get the PR to update.
        echo Updating PR...
        gh pr edit $BRANCH_NAME --base $MQ_BRANCH_NAME
    end

    # Build PR comment
    set LOG (jj log -r "(fork_point(trunk()::$CHANGE_ID)::$CHANGE_ID | $CHANGE_ID::latest(heads($CHANGE_ID:: & bookmarks(glob:'$USER/*')))) & bookmarks(glob:'$USER/*')" --no-pager --color=never --no-graph -T "'- REPLACE_BRANCH_NAME:' ++ remote_bookmarks.filter(|b| b.name().starts_with('$USER/') && b.remote() == 'git').map(|b| b.name()) ++ \"\n\"")

    echo $LOG | grep -o 'REPLACE_BRANCH_NAME.\+' | while read -r PATTERN
        set STK_BRANCH_NAME (echo $PATTERN | sed -E 's/REPLACE_BRANCH_NAME:(.*)/\1/')
        set PR_NUMBER (gh pr view $STK_BRANCH_NAME --json number --template '{{ .number }}')
        set PATTERN_ESCAPE (echo $PATTERN | sed -E 's/\//\\\//g')

        set SUFFIX ""
        if test $STK_BRANCH_NAME = $BRANCH_NAME
            set SUFFIX " 👈"
        end
        set LOG (echo $LOG | sed -E "s/$PATTERN_ESCAPE/#$PR_NUMBER$SUFFIX/g")
    end

    set DEFAULT_BRANCH (jj log -r "local_trunk()" -T "local_bookmarks.filter(|b| b.name() == 'master' || b.name() == 'main' || b.name() == 'trunk')" --no-pager --no-graph --color=never)

    set COMMENT_FILE (mktemp)
    echo "### 🥞 Pull Request Stack" >> $COMMENT_FILE
    echo $LOG >> $COMMENT_FILE
    echo "- \`$DEFAULT_BRANCH\`" >> $COMMENT_FILE
    echo "<!-- this_is_the_jj_pr_stack_comment -->" >> $COMMENT_FILE

    # Create or update PR comment
    set PR_NUMBER (gh pr list --head $BRANCH_NAME --json number | jq ".[] | .number")
    set OWNER_REPO (gh repo view --json owner,name --template "{{ .owner.login }}/{{ .name }}")
    set EXISTING_COMMENT (gh api --method GET repos/$OWNER_REPO/issues/$PR_NUMBER/comments | jq '.[] | select(.body | contains("this_is_the_jj_pr_stack_comment")) | .id')

    if test -n "$EXISTING_COMMENT"
        gh api --method PATCH repos/$OWNER_REPO/issues/comments/$EXISTING_COMMENT -F body=@$COMMENT_FILE --silent
    else
        gh pr comment $PR_NUMBER --body-file $COMMENT_FILE > /dev/null
    end

    rm $COMMENT_FILE
end

function jj-s
    if test (count $argv) -eq 0
        set REVSET "@"
    else
        set REVSET $argv[1]
    end

    set preview_cmd "jj diff --color=always -r $REVSET {1} --git | delta --side-by-side --minus-style \"syntax #500000\" --plus-style \"syntax #005000\" -w 200"

    jj show $REVSET -T 'description.first_line() ++ "\n"' --name-only | \
        fzf --ansi --tac --preview "$preview_cmd" --preview-window "right,80%" --header-lines 1 > /dev/null
end
