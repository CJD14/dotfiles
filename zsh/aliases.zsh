alias ls='ls++ -A'
alias cp='cp -iRv'
alias upfont='mkfontdir ~/.fonts;mkfontscale ~/.fonts;xset +fp ~/.fonts;xset fp rehash;fc-cache;fc-cache -fv'
alias c='clear'
alias cls='clear; ls'
alias mv='mv -v'
alias dir='dir --color=auto'
alias dmesg='dmesg --color'
alias free='free -m'
alias lss='/bin/ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias lsid'/bin/ls -lah --color=auto /dev/disk/by-id/'
#alias wget='wget --no-check-certificate -U=Mozilla'
alias ~='cd ~'
alias dot='cd ~/.dotfiles'
alias dotz='cd ~/.dotfils/zsh'
alias dotv='cd ~/.dotfiles/vim'
alias zshrc='vim ~/.dotfiles/zshrc'
alias vimrc='vim ~/.dotfiles/vimrc'
alias aliasrc='vim ~/.dotfiles/zsh/aliases.zsh'
alias tmuxrc='vim ~/.dotfiles/tmux.conf'
alias funcrc='vim ~/.dotfiles/zsh/funcs/misc-functions.zsh'
alias lsl='ls++ --groupivdirectories-first -Ah'
alias lsd='/bin/ls -FAv | grep /$ | column'
alias zshs='source ~/.dotfiles/zshrc'
alias pacin='sudo pacman -S' # pacman install
alias pacsrc='pacman -Ss'   # search pacman (also pacsearch)
alias pacupg='sudo pacman -Syu' # Sync with repos and upgrade packages
alias pacins='sudo pacman -U'  # install local file not in repos
alias pacrem='sudo pacman -Rns' # remove package and all config files, unneeded dependencies
alias pacre='sudo pacman -R'  # remove package and leave config and dependancies
alias pacinf='pacman -Si'     # display info about package in repos
alias pacc='sudo pacman -Scc' # Clean cache - delete all in cache
alias paclf='sudo pacman -Ql' # List all files installed by a package
alias pacupd='sudo pacman -Sy && sudo abs' # Update and refresh local agains rep
alias pacmir='sudo pacman -Syy' # refresh package list after update mirrorlist
alias aurain='sudo aura -A' # install aur package
alias aurainf='sudo aura -Ai' # get info about package on aur
alias auraclean='sudo aura -Akua' # upgrade all aur pkgs, show pkgbuild diffs, and remove unneeded makedeps
alias auraupd='sudo aura -Ayu' # sync pkg db and upgrade all aur pkgs
alias auraclin'sudo aura -Aa' # install and remove makedepends after
alias aurasrc='sudo aura -As' # search aur package by keyword
alias orphans='sudo aura -O' # display all orphan packages
alias orphanrem='sudo aura -Oj' # uninstall all orphans
alias findfn='sudo find / -type f -name'
alias df='df -H'
alias du='cdu -d ach'
alias diff='colordiff'
alias update-submodules="git submodule foreach 'git checkout master && git pull origin master'"
alias glog='git log --graph --oneline --decorate --date-order --color --boundary'
alias lh='ls -l .??*'
alias lhd='ls -ld .??*'
alias debugzsh='zsh -x 2>&1'
alias pt='ps aux | peco'
alias ll='/bin/ls -la | peco'
alias gitls='git ls-files | peco'
alias hist="awk '{FS=";"}{print $2}' ~/.zsh_history |peco |zsh"
#alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vimvundle='vim +PluginInstall +qall'
alias xres='xrdb -load ~/.Xresources'
alias irssi='TERM=screen-256color irssi'
alias srcalias='source ~/.dotfiles/zsh/aliases.zsh'
alias fzf='fzf-tmux'
alias weechat='export TERM=screen-256color && weechat'

alias serv='python -m SimpleHTTPServer'
alias mnted='mount | column -t'
alias mstcmd="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"

alias -g L='| less'

# Directory hash for quick cd
hash -d down='/home/cjd/Downloads'
hash -d dots='/home/cjd/.dotfiles'
hash -d zshdir='/home/cjd/.dotfiles/zsh'
hash -d antidir='/home/cjd/.dotfiles/antigen/repos'
hash -d repos='/home/cjd/.dotfiles/antigen/repos'
hash -d docs='/home/cjd/Documents'
hash -d conf='/home/cjd/.config'
hash -d fonts='/home/cjd/.fonts'

mcd () {
  mkdir -p $1
  cd $1
}

manpdf () {
  man -t $1 | ps2pdf - $1.pdf
}

# search aur and pacman repos simultaneously
archsrc () {
  aura -Ss $1; aura -As $1;
}

define() {
 curl dict://dict.org/d:$1
}
alias def="define"

# source simple user functions that were 
# used instead of aliases
source ~/.dotfiles/zsh/funcs/misc-functions.zsh
