defaults write -g ApplePressAndHoldEnabled -bool false

# Prevent Yubikey from draining battery
sudo pmset -b hibernatemode 25
sudo pmset -b standbydelay 300

# https://nexte.st/book/antivirus-gatekeeper.html#macos
# sudo spctl developer-mode enable-terminal
