autoload -U colors && colors
PS1="%B%F{yellow}%~ %(?.%F{blue}%#.%F{red}%#) %b%f"
export EDITOR="/usr/bin/vim"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
 # Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# autocomplete . and .. (special dirs)
zstyle ':completion:*' special-dirs true

# Use ctrl-vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# aliases
alias ls="gls -Fh --color=auto --group-directories-first"
alias starwars="telnet towel.blinkenlights.nl"
alias tree="tree -FC --dirsfirst -I .git"
alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop -nosplash"
alias o="open"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../../"
alias ........="cd ../../../../../../../"
alias .........="cd ../../../../../../../../"
alias ..........="cd ../../../../../../../../../"
alias ...........="cd ../../../../../../../../../../"
alias ............="cd ../../../../../../../../../../../"
alias .............="cd ../../../../../../../../../../../../"
alias ..............="cd ../../../../../../../../../../../../../"
alias ...............="cd ../../../../../../../../../../../../../../"
alias j="(){javac $1.java;java $1}"

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Enable syntax highlighting
source /Users/anton/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f "/Users/anton/.ghcup/env" ] && source "/Users/anton/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Users/anton/Library/Python/3.9/bin:$PATH"
