#if not running interactively, don't do anything
[[ $- != *i* ]] && return


#if x is running attach tmux to all terminals
if [[ -n $(ps -e | grep Xorg) ]]; then
   if [[ ! $TERM =~ screen ]]; then
      exec tmux
   fi
fi

#display fortune on new shell
fortune -a

#make it like fish
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

export EDITOR="vim"
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="mine"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# User configuration

#osx Path
export PATH="/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/Users/madmin/.cabal/bin:/Users/madmin/bin:/Library/Tex/texbin:."

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

#set up zsh auto suggestions
bindkey '^R' autosuggest-accept
bindkey '^T' autosuggest-clear

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
alias grep='grep --color=auto'
alias svim="sudo vim"
alias cls='clear'
alias dir='ls -a --color=auto'
alias pingc='ping -c 4 8.8.8.8'
alias temps='sensors | grep -e Core -e Physical'
alias ncm='ncmpcpp'

alias gl="git lag"

#vi mode
bindkey -v

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

#show normal flag in prompt normal mode
function zle-line-init zle-keymap-select {
VIM_PROMPT="%{$fg_bold[blue]%} [% NORMAL]%  %{$reset_color%}"
local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%} $EPS1"
zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
