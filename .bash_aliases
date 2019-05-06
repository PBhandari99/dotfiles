#
# ~/.bashrc.aliases
#

alias ls='ls --color=auto'

alias pacrepo='sudo reflector -l 20 -f 10 --save /etc/pacman.d/mirrorlist'
alias pacman='sudo pacman'
alias 'pacman-rm'='sudo pacman -Rncs'
alias yaourt='sudo yaourt'
alias apt='sudo apt'
alias journalctl='sudo journalctl'
alias pacu='sudo pacman -Syu --noconfirm'
alias auru='yaourt -Syua --noconfirm'
alias systemctl='sudo systemctl'
alias se='ls /usr/bin | grep'
alias cat='bat'

alias ls='ls -hN --color=auto --group-directories-first'
alias la='ls -a'
alias ll='ls -lhA'
# alias ls='ls -CF'
alias sl='ls'  # typo proof
alias lsl='ls -lhFA | less'
alias mkdir='mkdir -pv'
alias myip='curl http://ipecho.net/plain; echo'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias emacs='emacs -nw'
alias vimrc='vim ~/.config/nvim/init.vim'
alias bashrc='vim ~/.bashrc'
alias sv='sudo nvim'
alias c='clear'
alias e='exit'
alias diff='colordiff'
alias grep='grep --color=auto'

alias reload-bash='source ~/.bashrc'
alias reload-i3='i3-msg reload'
alias gnome-setting='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'


# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -i'
alias rm='rm -I --preserve-root'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# mysql
alias sql='mysql -h localhost -u root -pHe110SQL'

alias ff='firefox'
alias chrome='chromium'
alias setting='cinnamon-settings'

export QT_STYLE_OVERRIDE=gtk
export QT_SELECT=qt5

if [[ $LANG = '' ]]; then
	export LANG=en_US.UTF-8
fi
