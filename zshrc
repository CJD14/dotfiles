###################################################
# file: ~/.zshrc                                  #
# author: cody diehl                              #
###################################################

DOTDIR=$HOME/.dotfiles
HISTFILE=$DOTDIR/zsh/zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
MYVIMRC=/home/cjd/.vimrc
#TERMINFO=/usr/share/terminfo

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Go variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

ZSHA_BASE=$HOME/.dotfiles/antigen
ADOTDIR=$HOME/.dotfiles/antigen
source $ZSHA_BASE/antigen.zsh

antigen use oh-my-zsh
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle tarruda/zsh-autosuggestions
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle robbyrussell/oh-my-zsh plugins/git
antigen bundle RobSis/zsh-completion-generator
antigen-bundle Tarrasch/zsh-bd
antigen-bundle tmux
antigen-bundle command-not-found
antigen-bundle wd
antigen bundle extract
antigen theme candy
antigen apply

source ~/.dotfiles/zsh/myprompt.zsh-theme

export TERM="xterm-256color"
setopt RM_STAR_WAIT
setopt interactivecomments
setopt CORRECT
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

source ~/.dotfiles/zsh/zsh-syntax-highlighting.zsh
source ~/.dotfiles/zsh/zsh-syntax-highlighting-filetypes.zsh
source ~/.dotfiles/zsh/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

source $ADOTDIR/repos/https-COLON--SLASH--SLASH-github.com-SLASH-tarruda-SLASH-zsh-autosuggestions.git/autosuggestions.zsh
# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

eval $( dircolors -b $HOME/.dotfiles/dircolors)

source ~/.dotfiles/zsh/aliases.zsh
# Base16 Shell Colors
#BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

man() {
    env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

# set X11 backend for clutter for finalterm
export CLUTTER_BACKEND=x11

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=25

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# auto-fu init
autoload -Uz compinit; compinit
source ~/.dotfiles/zsh/auto-fu.zsh/auto-fu.zsh
zle-line-init () auto-fu-init; zle -N zle-line-init

# list color completion
fpath+=/home/cjd/.dotfiles/zsh 
autoload -Uz list-colors-init; list-colors-init
zstyle -e ':completion:*:default' list-colors list-colors list-colors-aux
# zstyle ':completion:*' group-name ''
# If you want to make it to respect directory-type color setting, you need
# to uncomment above line, please.
