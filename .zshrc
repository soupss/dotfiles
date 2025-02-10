autoload -U colors && colors
export EDITOR="/usr/bin/vim"
LANG='en_US.UTF-8'

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
alias vim="nvim"
alias vimm="vim"
alias ls="ls -Fh --color=auto --group-directories-first"
alias starwars="nc towel.blinkenlights.nl 23"
alias tree="tree -FC --dirsfirst -I .git"
alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop -nosplash"
alias o="open"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Enable syntax highlighting
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh vi mode plugin
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

ZVM_VI_HIGHLIGHT_BACKGROUND=#665c54
ZVM_CURSOR_STYLE_ENABLED=false

PS1=$'%B%F{green}%n%f%b at %B%F{cyan}%m %F{yellow}%~\n%(?.%F{blue}.%F{red})> %b%f'

# The plugin will auto execute this zvm_after_select_vi_mode function
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
        export PS1=$'%B%F{green}%n%f%b at %B%F{cyan}%m %F{yellow}%~\n%(?.%F{blue}.%F{red})< %b%f'
    ;;
    $ZVM_MODE_INSERT)
        export PS1=$'%B%F{green}%n%f%b at %B%F{cyan}%m %F{yellow}%~\n%(?.%F{blue}.%F{red})> %b%f'
    ;;
    $ZVM_MODE_VISUAL)
        export PS1=$'%B%F{green}%n%f%b at %B%F{cyan}%m %F{yellow}%~\n%(?.%F{blue}.%F{red})v %b%f'
    ;;
    $ZVM_MODE_VISUAL_LINE)
        export PS1=$'%B%F{green}%n%f%b at %B%F{cyan}%m %F{yellow}%~\n%(?.%F{blue}.%F{red})v %b%f'
    ;;
    $ZVM_MODE_REPLACE)
        export PS1=$'%B%F{green}%n%f%b at %B%F{cyan}%m %F{yellow}%~\n%(?.%F{blue}.%F{red})^ %b%f'
    ;;
  esac
}


[ -f "/Users/anton/.ghcup/env" ] && source "/Users/anton/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Users/anton/Library/Python/3.9/bin:$PATH"
source /Users/anton/emsdk/emsdk_env.sh >/dev/null 2>&1


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
