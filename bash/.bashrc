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
        echo
        echo "Usage: c_run file1.c [file2.c ...]"
        echo
        return 1
    fi

    first="$1"
    output="${first%.c}"

    echo       # blank line before compilation
    echo "Compiling $*..."
    echo       # another blank line

    gcc -std=c17 -Wall -Wextra "$@" -o "$output"

    if [ $? -ne 0 ]; then
        echo       # blank line after errors
        echo "Compilation failed."
        echo
        return 1
    fi

    echo       # blank line before running
    echo "Running $output..."
    echo

    ./"$output"

    echo       # blank line after program output
}


PS1='[\u@\h \W]\$ '
neofetch
export PATH="$HOME/.local/bin:$PATH"
export DATABASE_PASSWORD="supreme11"
