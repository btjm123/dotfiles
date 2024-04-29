autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f [%F{blue}%C%f] %F{red}${vcs_info_msg_0_}%f> '

alias ls="ls -lAhvf"
alias kittyconf="code ~/.config/kitty/kitty.conf"
alias kittytheme="kitty +kitten themes"
alias zshrc="code ~/.zshrc"
alias reload='source ~/.zshrc;echo "ZSH aliases sourced."' 

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh