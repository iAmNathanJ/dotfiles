xcode-select -v || xcode-select --install

defaults write -g AppleShowScrollBars -string WhenScrolling
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock largesize -int 96
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock tilesize -int 48
killall Dock

