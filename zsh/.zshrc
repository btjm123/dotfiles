# zsh prompt customisation
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{green}%*%f [%F{blue}%C%f] %F{red}${vcs_info_msg_0_}%f${NEWLINE}> '

# env variables
export TERM="xterm-256color"
export PF_ASCII="Catppuccin"

# shortcuts
alias ls="eza -l --icons"
alias lsf="eza -TL 3"
alias lsff="eza -TL 5"
alias kittyconf="code ~/.config/kitty/kitty.conf"
alias kittytheme="kitty +kitten themes"
alias zshrc="code ~/.zshrc"
alias reload='source ~/.zshrc;echo "ZSH aliases sourced."'
alias stopyabai="yabai --stop-service && skhd --stop-service"
alias startyabai="yabai --start-service && skhd --start-service"

# temporary as im adding config
alias cpzshrc="cd ~/Desktop/personal/dotfiles && cp ~/.zshrc ./zsh/.zshrc"
alias cpkittyconf="cd ~/Desktop/personal/dotfiles && cp ~/.config/kitty/kitty.conf ./kitty/kitty.conf"

# load required dependancies
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# custom commands to run on start
cd ~/Desktop
pfetch
