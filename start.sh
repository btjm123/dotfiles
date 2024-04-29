#!/usr/bin/env sh

# install brew + other utilities
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
brew install git
brew install zsh-autosuggestions
brew install bat
brew install git-delta

# windows tiling manager
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai
yabai --start-service
skhd --start-service

# is there a better way of doing this ?
git clone https://github.com/GuardKenzie/pfetch-with-kitties.git
sudo install pfetch-with-kitties/pfetch /usr/local/bin/
rm -rf pfetch-with-kitties

# nvim config stuff