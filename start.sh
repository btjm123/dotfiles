#!/usr/bin/env sh

# install brew + other utilities
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
brew install git
brew install zsh-autosuggestions
brew install bat
brew install git-delta

# nvim config stuff