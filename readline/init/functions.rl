# vim: filetype=readline
#
# functions.rl - Readline functions
#
# Source this file directly from bash
#   bind -f $HOME/dots/readline/init/functions.rl

"\C-xv":    show-bash-version
"\C-xr":    re-read-init-file

# cycle completions forward: TAB
TAB:        menu-complete
# cycle completions backward: s-TAB
"\e[Z":     menu-complete-backward

# search preseeded history forward: DOWN
"\e[B":     history-search-forward
# search preseeded history backward: UP
"\e[A":     history-search-backward

# word forward: c-RIGHT [1;5C
"\e[1;5C":  forward-word
# word backward: c-LEFT [1;5D
"\e[1;5D":  backward-word

# c-BS
"^_":       backward-kill-word

# c-BS     
# s-BS     
# c-s-BS   
# c-DEL    [3;5~
#
