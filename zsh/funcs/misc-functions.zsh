# a visual recursive list of all files and dirs
function treedir()
  {
    find . | sed -e 's/[^\/]*\//|--/g' -e 's/-- |/    |/g' | $PAGER
  }

# recursive text search
function f() {
  find . | sed -e 's/[^\/]*\//|--/g' -e 's/-- |/  |/g' | $PAGER
}

# recursive search and replace ignores hidden files and dirs/ ex. replace foo bar
function replace() {
  find . \( ! -regex '.*/\..*' \) -type f | xargs perl -pi -e "s/$1/$2/g"
}

#vim - thanks to earsplit for this!
conf() {
 case $1 in
  tmux)    vim ~/.tmux.conf ;;
  vim)     vim ~/.vimrc ;;
  xd)      vim ~/.Xdefaults ;;
  zsh)     vim ~/.zshrc && source ~/.zshrc ;;
  alias)   aliasrc  && source ~/.dotfiles/zsh/aliases.zsh;;
  i3)      vim ~/.config/i3/config ;;
  pacman)  sudo vim /etc/pacman.conf ;;
  mutt)    vim ~/.muttrc ;;
  weechat) vim ~/.weechat/weechat.conf ;;
  ls)      vim ~/.ls++.conf ;;
  bash)    vim ~/.bashrc ;;
  git)     vim ~/.gitconfig ;;
  clip)    vim ~/.config/clipit/clipitrc ;;
  termite) vim ~/.config/termite/config ;;
  ranger)  vim ~/.config/ranger/rc.conf ;;
  htop)    vim ~/.config/htop/htoprc ;;
  dwb)     vim ~/.config/dwb/settings ;;
  *)       echo "unknown conf: $1" ;;  
 esac
}
