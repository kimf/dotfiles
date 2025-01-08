#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install


# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae

## Chezmoi
brew install chezmoi

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install --cask nikitabobko/tap/aerospace
brew install sketchybar
brew install borders

### Fonts
brew tap homebrew/cask-fonts
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code


### cli and git stuff
brew install git
brew install git-lfs
brew install parallel
brew install asdf
brew install bat
brew install starship
brew install git-delta
brew install lazygit
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting
brew install nowplaying-cli
brew install mas


### The usual first downloads
brew install --cask appcleaner
brew install --cask logi-options+
brew install --cask messenger
brew install --cask telegram
brew install --cask visual-studio-code
brew install --cask arc
brew install --cask spotify
brew install --cask ghostty
brew install --cask vial

### commmunication
brew install --cask discord
brew install --cask slack

## work stuff + miscs
brew install --cask microsoft-azure-storage-explorer

brew install --cask dataflare

brew install --cask chatgpt

brew install --cask expo-orbit
brew install --cask figma

brew install --cask firefox
brew install --cask google-chrome

brew install --cask insomnia

brew install --cask kap

brew install --cask miro
brew install --cask orbstack
brew install  --cask omnidisksweeper

brew install coreutils

# macOS Settings
echo "Changing macOS defaults..."

defaults write com.apple.iphonesimulator ShowSingleTouches 1

defaults write com.apple.dock autohide -bool true
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write com.apple.dock expose-group-apps -bool true
defaults write com.apple.spaces spans-displays -bool true
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


# Mac App Store Apps
echo "Installing Mac App Store Apps..."
# mas install 497799835 #xCode
mas install 517914548 #dashlane
mas install 1091189122 #bear markdown notes

# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:kimf/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master

mkdir ~/work
mkdir ~/projects

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf


source $HOME/.zshrc
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no


# asdf plugins
echo "Installing asdf plugins."
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add python

# Start Services
echo "Starting Services (grant permissions)..."
brew services start sketchybar
brew services start borders

csrutil status

echo "Installation complete...\n"
