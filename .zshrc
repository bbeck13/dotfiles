# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#display fortune on new shell
fortune -a
bindkey -v

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

#only for personal efi computers
alias boot='sudo /boot/move.sh'
alias update2='sudo gummiboot --path=/boot/efi update'

#make it like fish
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

#Prompt
#PROMPT='[%#%d]%B>%b '
#PROMPT="%{$fg_bold[green]%}[%{$reset_color%}%{$fg[white]%}%1d%{$reset_color%}%{$fg_bold[green]%}]%{$reset_color%}%{$fg_bold[red]%}> "
PROMPT="%{$fg_bold[green]%}[%{$reset_color%}%{$fg[white]%}%1d%{$reset_color%}%{$fg_bold[green]%}]%{$reset_color%}%{$fg_bold[red]%}> "
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"


#if x is running attach tmux to all terminals
if [[ -n $(ps -e | grep X) ]]; then
   if [[ ! $TERM =~ screen ]]; then
      exec tmux
   fi
fi

#blur transparent konsole / yakuake windows needs kde
#if [ `qdbus | grep konsole` ]; then
#   xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id `qdbus org.kde.konsole /konsole/MainWindow_1 winId`;
#fi
#if [ `qdbus | grep yakuake` ]; then
#   xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -name Yakuake;
#fi

typeset -A key
#fix home and end keys
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

export EDITOR="vim"

# Setup zsh-autosuggestions
source /home/badmin/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
