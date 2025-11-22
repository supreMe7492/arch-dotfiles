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


c_run() {
    if [ $# -eq 0 ]; then
        echo "Usage: c_run file1.c [file2.c ...]"
        return 1
    fi

    # Use first file name as output binary
    first="$1"
    output="${first%.c}"

    # If multiple files, compile them all
    gcc -std=c17 -Wall -Wextra "$@" -o "$output"

    if [ $? -ne 0 ]; then
        echo "Compilation failed. Check errors above."
        return 1
    fi

    echo "Compilation succeeded. Running $output..."
    ./"$output"
}
PS1='[\u@\h \W]\$ '
neofetch
export PATH="$HOME/.local/bin:$PATH"
export DATABASE_PASSWORD="supreme11"
