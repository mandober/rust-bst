#!/usr/bin/env bash

# hooks:
# MAIL, MAILPATH, MAILCHECK
# PS0, PS1, PROMPT_COMMAND
# BASH_ENV, ENV


# BASH_ENV
# If set, its value (subject to parameter expansion, command substitution, and 
# arithmetic expansion) is interpreted as a filename to a file that will be 
# sourced in the same environment as the script about to be executed. 
# (BASH_ENV has to be exported and resultant filename has to be absolute)
export BASH_ENV=$HOME/pre-script-hook.bash


# MAIL
# If this parameter is set to a file name and the MAILPATH variable is not set, bash 
# informs the user of the arrival of mail in the specified file.
# It can be used to monitor any file for changes; To monitor several files see MAILPATH.
MAIL=$HOME/.bashrc


# MAILPATH
# Colon-separated list of file names to be checked for mail. The message to be printed 
# when mail arrives in a particular file may be specified by separating the file name 
# from the message with a ?. When used in the text of the message, $_ expands to the 
# name of the current mail file. Here’s an example:
# MAILPATH='/var/mail/bfox?"You have mail":~/shell-mail?"$_ has mail!"'
# Bash supplies a default value for this variable, but the location of the user mail 
# files that it uses is system dependent (for example, /var/mail/$USER)
MAILPATH='$HOME/.bashrc?$_ changed!:$HOME?Dir $_ changed!'


# MAILCHECK
# Specifies how often (in seconds) bash checks for mail. The default is 60 seconds. When
# it is time to check for mail, the shell does so before displaying the primary prompt. 
# If this variable is unset or set to a value that is not a number greater than or equal 
# to zero, the shell disables mail checking.
MAILCHECK=120
