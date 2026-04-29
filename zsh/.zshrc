# zsh prompt customisation
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %b'
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT_PATH='%~'
# short for togglepath
tp() {
  if [[ "$PROMPT_PATH" == "%~" ]]; then
    PROMPT_PATH=" %c"
  else
    PROMPT_PATH="%~"
  fi
}
PROMPT='${NEWLINE}%F{green}%*%f [%F{blue}${PROMPT_PATH}%f] %F{red}${vcs_info_msg_0_}%f${NEWLINE}%F{blue}❯%f '

# env variables
export TERM="xterm-256color"
export PF_ASCII="Catppuccin"

# from profiling, sourcing sdkman-unit.sh seems to be slow so let's lazy load this too
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
  unset -f sdk
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}
export _ZO_ECHO=1

# zoxide
source ~/.zoxide.zsh
alias cd='z'
alias cdi='zi'

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
alias findfile='FILE=$(fzf) && [ -n "$FILE" ] && open -R "$FILE"'

alias startpsql='brew services start postgresql@14'
alias stoppsql='brew services stop postgresql@14'
alias restartpsql='brew services restart postgresql@14'
alias statuspsql='brew services list | grep postgres'
# temporary as im adding config
alias cpzshrc="cd ~/Desktop/personal/dotfiles && cp ~/.zshrc ./zsh/.zshrc"
alias cpkittyconf="cd ~/Desktop/personal/dotfiles && cp ~/.config/kitty/kitty.conf ./kitty/kitty.conf"

# cs2030s stuff
alias syncvim="rsync -avz btjm123@pe112.comp.nus.edu.sg:~/.vimrc ~/Desktop/dotfiles/vim/.vimrc"
alias sshjava="ssh btjm123@pe112.comp.nus.edu.sg"

# cs4222 stuff
unalias make_texas 2>/dev/null
make_texas() {
	make TARGET=cc26x0-cc13x0 BOARD=sensortag/cc2650 "$@"
} 
alias ls_texas=" ls /dev/tty* | grep usb"

# load required dependancies
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Hugo Version Manager: override path to the hugo executable.
export PATH="$HOME/go/bin:$PATH"
hugo() {
  hvm_show_status=true
  if hugo_bin=$(hvm status --printExecPathCached); then
    if [ "${hvm_show_status}" = "true" ]; then
      >&2 printf "Hugo version management is enabled in this directory.\\n"
      >&2 printf "Run 'hvm status' for details, or 'hvm disable' to disable.\\n\\n"
    fi
  else
    if hugo_bin=$(hvm status --printExecPath); then
      if ! hvm use --useVersionInDotFile; then
        return 1
      fi
    else
      if ! hugo_bin=$(whence -p hugo); then
        >&2 printf "Command not found.\\n"
        return 1
      fi
    fi
  fi
  "${hugo_bin}" "$@"
}

# custom commands to run on start
# Kitty starts shell in $HOME which implies a new terminal window instance
if [[ "$PWD" == "$HOME" ]]; then
  cd ~/Desktop
fi
pfetch

# for future reference, use `conda init zsh` and this will be auto populated
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export KMP_DUPLICATE_LIB_OK=TRUE
