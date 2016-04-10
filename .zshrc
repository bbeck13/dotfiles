#README\/
#Note for everything to work the following must be installed
#oh-myzsh must be installed at ~/.oh-my-zsh
#see https://github.com/robbyrussell/oh-my-zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#if x is running attach tmux to all terminals
if [[ -n $(ps -e | grep Xorg) ]]; then
   if [[ ! $TERM =~ screen ]]; then
      TERM=xterm-256color
      exec tmux
   fi
fi

#display fortune on new shell
fortune -a

#aliases
alias bat='acpi | grep -o "[0-9]*%"'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias svim="sudo vim"
alias cls='clear'
alias dir='ls -a --color=auto'
alias sleep='systemctl suspend'
alias pingc='ping -c 4 8.8.8.8'
alias bye='shutdown now'
alias permissions="stat -c '%a %n' *" #show octal permissions
alias xfluxs='xflux -z 93401'
alias temps='sensors | grep -e Core -e Physical'
alias ncm='ncmpcpp'

#only for personal efi computers
alias boot='sudo /boot/update.sh'
alias update2='sudo gummiboot --path=/boot/efi update'

#make it like fish
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload predict-on
predict-on
autoload -U compinit
compinit
zstyle ':completion:*' menu select
setopt completealiases
setopt correctall
setopt nohashdirs
autoload -U colors && colors

#History
HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY
HISTSIZE=1200                  # lines of history to maintain memory
SAVEHIST=1000

#Prompt deprecated with oh-my-zsh
#PROMPT='[%#%d]%B>%b '
#PROMPT="%{$fg_bold[green]%}[%{$reset_color%}%{$fg[white]%}%1d%{$reset_color%}%{$fg_bold[green]%}]%{$reset_color%}%{$fg_bold[red]%}> "
#PROMPT="%{$fg_bold[green]%}[%{$reset_color%}%{$fg[white]%}%1d%{$reset_color%}%{$fg_bold[green]%}]%{$reset_color%}%{$fg_bold[red]%}> "
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"

#blur transparent konsole / yakuake windows needs kde
#if [ `qdbus | grep konsole` ]; then
#   xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id `qdbus org.kde.konsole /konsole/MainWindow_1 winId`;
#fi
#if [ `qdbus | grep yakuake` ]; then
#   xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -name Yakuake;
#fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

#oh my zsh theme
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="Mine"
ZSH_THEME="fishy"
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

#oh-my-zsh options
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH="/bin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:."
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#vi mode
bindkey -v
export EDITOR="vim"

#fix home and end keys
typeset -A key
key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Delete]=${terminfo[kdelete]}
bindkey "\e[3~" delete-char

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Delete]}"      ]]  && bindkey  "${key[Delete]}" delete
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
   function zle-line-init () {
      printf '%s' "${terminfo[smkx]}"
   }
   function zle-line-finish () {
      printf '%s' "${terminfo[rmkx]}"
   }
   zle -N zle-line-init
   zle -N zle-line-finish
fi

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

#471 stuff
export EIGEN3_INCLUDE_DIR=~/.local/lib/eigen-eigen-b30b87236a1b
export GLFW_DIR=~/.local/lib/glfw-3.1.2
export CPLUS_INCLUDE_PATH=~/.local/lib/glfw-3.1.2/include:~/.local/lib/glew-1.13.0/include
export GLEW_DIR=~/.local/lib/glew-1.13.0

#show normal flag in prompt normal mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[green]%} [% NORMAL]%  %{$reset_color%}"
    local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
