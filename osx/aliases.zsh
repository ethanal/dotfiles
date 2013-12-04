alias fixau=sudo killall -9 appleeventsd
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias man2pdf="man -t '${1}' | open -f -a /Applications/Preview.app"
alias quicklook=qlmanage -p "${1}"

