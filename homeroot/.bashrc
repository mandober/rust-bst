#!/bin/env bash
# ==============================================================================
# FILE: .bashrc
# DESC: executed by bash for interactive, non-login, shells
# REPO: https://github.com/mandober/dotfiles
# EDIT: 2018-08-11
# TYPE: wsl/ubuntu 18.04.01
#
# CONTENT: This file contains only some basic settings - the full list
#          of all available settings, sorted by category (one file per
#          category of settings) along with their descriptions, is in:
#          $HOME/dots/* files.
#
#   In .bashrc        All settings:
#   - dircolors
#   - umask
#   - history         $HOME/dots/history
#   - completions     $HOME/dots/completing
#   - globbing        $HOME/dots/globbing
#   - cd              $HOME/dots/cding
#
# ==============================================================================


# ======================================================================== INTRO
# punch-in
[[ -t 2 ]] && {
	printf "[\e[32m✔\e[0m] %s\n" "WSL: Ubuntu 18.04.01 xfc4 2018-07-15"
	printf "[\e[32m✔\e[0m] %s\n" ".bashrc"
} >&2

# dircolors
eval "$(dircolors -b ~/.dircolors)"

# umask
umask 0022

# ====================================================================== HISTORY
# For full list of settings and their descriptions see:
# $HOME/dots/history

export HISTCONTROL="ignorespace:ignoredups:erasedups"
# exclude from history entries starting with space, duplicated entries,
# delete duplicated entries


# ===================================================================== GLOBBING
##  shopt
shopt -s extglob
shopt -s dotglob
shopt -s globstar
shopt -s nocaseglob
shopt -s nullglob
shopt -u failglob
shopt -s globasciiranges

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar



# ==================================================================== DEBUGGING
##  shopt
#shopt -u extdebug
#shopt -u shift_verbose
#shopt -u inherit_errexit     # bash 4.4


# ========================================================================= MISC
##  shopt
shopt -s cdspell
#shopt -u autocd
shopt -s dirspell
#shopt -u cdable_vars
shopt -u huponexit
shopt -s checkjobs
shopt -s expand_aliases
shopt -s checkhash
shopt -u execfail
shopt -s checkwinsize
#shopt -s interactive_comments
#shopt -u lastpipe
#shopt -s login_shell
#shopt -u mailwarn
#shopt -u nocasematch


# ================================================================ COMPATIBILITY
##  shopt
shopt -s xpg_echo
shopt -s extquote
shopt -s sourcepath
#shopt -u gnu_errfmt
#shopt -u restricted_shell
#shopt -u compat31
#shopt -u compat32
#shopt -u compat40
#shopt -u compat41
#shopt -u compat42
#shopt -u compat43

# ================================================================== COMPLETIONS
shopt -s complete_fullquote
shopt -u direxpand
shopt -s force_fignore
#shopt -s hostcomplete
shopt -s no_empty_cmd_completion
#shopt -s progcomp


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# ======================================================================= PROMPT
#shopt -s promptvars

#
# prompt: chroot
#

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac
#
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
#
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# ========================================================================= less
# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"




# =========================================================================== ls
# ls, dircolors
#
# enable color support of ls
# if [ -x /usr/bin/dircolors ]; then
#   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
# fi



# ====================================================================== Aliases
#
# alert
# Add an "alert" alias for long running commands.
# Use like so: sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# print path
alias pp="echo ${PATH//:/$'\f\r'}"

# find
alias fd="find . -type d -iname"
alias ff="find . -type f -iname"

# services
alias ss="sudo systemctl"
alias ssr="sudo systemctl restart"
alias sst="sudo systemctl start"
alias ssp="sudo systemctl stop"
alias sss="sudo systemctl status"
alias ssa="sudo service --status-all"

# sudo
alias v=vim
alias sv="sudo vim"
alias sm="sudo mc ."

# ls
alias l="ls --almost-all --classify --human-readable --group-directories-first --color=auto"
alias ll="l -l"

# grep m- show differences in colour
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# df, du - human readable sizes
alias df='df -h'
alias du='du -h'

# which
alias w="which -a"

# apt
alias sau="sudo apt update"
alias sag="sudo apt upgrade"
alias sai="sudo apt install"
alias sas="sudo apt search"

# cargo
alias cr="cargo run"
alias cn="cargo new"
alias cb="cargo build"
alias ci="cargo install"
alias ca="cargo add"
alias ct="cargo test"

# git
alias gc="git clone"
alias gp="git pull"

# exa (ls replacement)
#alias mm='exa -l --color=auto -a -F -h -H -g'

# ================================================================== PREFERENCES
export EDITOR=vim
export MANPAGER=most

# ================================================================== ENVIRONMENT
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# vcxsrv
export DISPLAY=localhost:0.0
export LIBGL_ALWAYS_INDIRECT=1
export NO_AT_BRIDGE=1

# =============================================================== INSTALLED APPS
# asdf - universal version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
