ZSH_TMUX_AUTOSTART=true
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/pb/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="theunraveler"

bindkey '^G' forward-word
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        archlinux
        git
        colored-man-pages
        zsh-autosuggestions
        sudo
        tmux
        )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#

# Bind keys to jump words
# bindkey '^[' forward-word

export PATH=$PATH:/.gem


PROMPT_COMMAND='echo -n -e "\033]0; ${PWD}\007"'
/usr/bin/setxkbmap -option "caps:swapescape"

########################################
#                                      #
#              Aliases                 #
#                                      #
########################################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias zshrc='vim ~/.zshrc'
alias sv='sudo nvim'
alias c='clear'
alias b='cd ..'
alias e='exit'
alias diff='colordiff'
alias grep='grep --color=auto'

alias reload-bash='source ~/.bashrc'
alias reload-zsh='source ~/.zshrc'
alias reload-i3='i3-msg reload'
alias gnome-setting='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'


# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -i'
alias rm='rm -I --preserve-root'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias ff='firefox'
alias chrome='chromium'
alias setting='cinnamon-settings'
