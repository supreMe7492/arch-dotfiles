#
# ~/.bashrc
#
#eval "$(starship init bash)"


export TERMINAL=kitty
export XDG_DATA_DIRS="/usr/share:/usr/local/share:/home/$USER/.local/share:/usr/share/applications"
export XDG_ICON_THEME="Papirus"  # Replace with the theme you are using


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
neofetch
export PATH="$HOME/.local/bin:$PATH"
export DATABASE_PASSWORD="supreme11"
