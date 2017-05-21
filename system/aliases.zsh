alias pg="gist -pc"
alias keybase="GPG_TTY=$(tty) keybase"
alias gpg="gpg2"
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo 'Public key copied to pasteboard.'"

# If the last character of the alias value is a blank, then the next command
# word following the alias is also checked for alias expansion. This makes sudo
# work correctly with aliases.
alias sudo='sudo '
