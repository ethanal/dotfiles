defaults write -g NSRequiresAquaSystemAppearance -bool Yes
defaults write com.apple.notificationcenterui NSRequiresAquaSystemAppearance -bool No
defaults write com.apple.Spotlight NSRequiresAquaSystemAppearance -bool No
defaults write com.manytricks.Moom NSRequiresAquaSystemAppearance -bool No

# Prevent Yubikey from draining battery
sudo pmset -b hibernatemode 25
sudo pmset -b standbydelay 300
