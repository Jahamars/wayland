# Enable Powerlevel10k instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load and initialize the completion system
autoload -Uz compinit
compinit

# Source powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Source autosuggestions
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Completion settings
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'



plugins=(
    gh
    git
    archlinux
    zsh-syntax-highlighting
    zsh-autosuggestions
)




# Autosuggestions settings
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

# Useful aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias sys='systemctl'
alias pac='sudo pacman'

alias sshr='sudo systemctl restart ssh'
alias sshs='sudo systemctl stop ssh'
alias sshh='sudo systemctl status ssh'
alias wip="ip -4 addr show dev wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias py='python3'
alias trash='mv --force -t ~/.local/share/Trash '
alias hg='history|grep'
alias ports='ss -tulpn'
alias path='echo -e ${PATH//:/\\n}'
alias note='micro ~/notes/today.md '


ranger-cd() {
    local tempfile=$(mktemp)
    ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
    [ -f "$tempfile" ] && cd -- "$(cat "$tempfile")" && rm -f "$tempfile"
    VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd
##########################################


##########################################
compile_and_run_cpp() {
    local source_file="$1"
    local executable_file="${source_file%.cpp}"

    g++ -std=c++17 -o "$executable_file" "$source_file" && ./"$executable_file"
}
alias cpp='compile_and_run_cpp'
mkcpp() {
    if [[ $1 == *.cpp ]]; then
        echo -e "#include <iostream>\nusing namespace std;\n\nint main() {\n    // Your code here\n    return 0;\n}" > "$1" && nvim "$1"
    else
        echo "Error: The file must have a .cpp extension"
    fi
}
############################################




# Environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM=xterm-256color
export DISABLE_AUTO_UPDATE="true"
export NO_BELL=true
setopt NO_BEEP  

export PATH="$HOME/.cargo/bin:$PATH"

# Key bindings
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

DIRSTACKSIZE=20
setopt AUTO_PUSHD           # Автоматически добавлять директории в стек
setopt PUSHD_IGNORE_DUPS    # Не добавлять дубликаты
setopt PUSHD_MINUS         # Поменять знак минус и плюс в pushd


# Additional options
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt CORRECT
setopt COMPLETE_IN_WORD

# Load powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
