#!/usr/bin/env bash

# handles:
# command_not_found_handle
# BUILTIN_builtin_load
# BUILTIN_builtin_unload
# cd



# BUILTIN_builtin_load
# `enable -f` attempts to call this function when loading a loadable builtin
# This allows loadable builtins to run initialization and cleanup code.

# BUILTIN_builtin_unload
# `enable -f` attempts to call this function when unloading a loadable builtin
# This allows loadable builtins to run initialization and cleanup code.

# cd
# If executing implicit `cd` when the `autocd` option is set, bash will now invoke a 
# function named `cd` if it exists before executing cd builtin.


### command_not_found_handle
#
# As of bash 4, when a command search fails, the shell executes a shell function named 
# command_not_found_handle using the failed command as arguments. This can be used to 
# provide user friendly messages or install software packages etc. Since this function 
# runs in a separate execution environment, you can't influence the main shell with it.
#
# This application implements the command-not-found spec at:
# https://wiki.ubuntu.com/CommandNotFoundMagic
#
# If you want automatic prompts to install the package, set
# COMMAND_NOT_FOUND_INSTALL_PROMPT in your environment.
#
# To use it in bash, please add the following line to your .bashrc file:
# . /etc/bash_command_not_found
#
# To use it in zsh, please add the following line to your .zshrc file:
# . /etc/zsh_command_not_found
# Note that it overrides the preexec and precmd functions, in case you have defined your own.
#
#
# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
        # check because c-n-f could've been removed in the meantime
        if [ -x /usr/lib/command-not-found ]; then
		    /usr/lib/command-not-found -- "$1"
            return $?
        elif [ -x /usr/share/command-not-found/command-not-found ]; then
		    /usr/share/command-not-found/command-not-found -- "$1"
            return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi


