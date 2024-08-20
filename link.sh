rm ~/.zshrc
ln -s ~/Desktop/dotfiles/zsh/.zshrc ~/.zshrc

rm ~/.gitconfig
ln -s ~/Desktop/dotfiles/git/.gitconfig ~/.gitconfig

rm -rf ~/.config/kitty
mkdir -p ~/.config/kitty
ln -s ~/Desktop/dotfiles/kitty/* ~/.config/kitty/

rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim
ln -s ~/Desktop/dotfiles/nvim/* ~/.config/nvim/

rm -rf ~/.config/skhd
mkdir -p ~/.config/skhd
ln -s ~/Desktop/dotfiles/skhd/* ~/.config/skhd/

rm -rf ~/.config/yabai
mkdir -p ~/.config/yabai
ln -s ~/Desktop/dotfiles/yabai/* ~/.config/yabai/


