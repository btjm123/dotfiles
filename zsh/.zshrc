# zsh prompt customisation
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f [%F{blue}%C%f] %F{red}${vcs_info_msg_0_}%f> '

# shortcuts
alias ls="ls -lAhvf"
alias kittyconf="code ~/.config/kitty/kitty.conf"
alias kittytheme="kitty +kitten themes"
alias zshrc="code ~/.zshrc"
alias reload='source ~/.zshrc;echo "ZSH aliases sourced."'

# temporary as im adding config
alias cpzshrc="cd ~/Desktop/personal/dotfiles && cp ~/.zshrc ./zsh/.zshrc"
alias cpkittyconf="cd ~/Desktop/personal/dotfiles && cp ~/.config/kitty/kitty.conf ./kitty/kitty.conf"

# load required dependancies
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

cd ~/Desktop