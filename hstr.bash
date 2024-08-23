# hstr.bash
# hstr is an app that enables interactive history á la dmenu

#| history menu triggered with C-r
#alias h=hstr

#| more colors
#export HSTR_CONFIG=hicolor

#| If interactive shell then bind
#if [[ $- =~ .*i.* ]]; then
   #| hstr to c-r
   #bind '"\C-r": "\C-a hstr -- \C-j"'
   #| 'kill last command' to c-x k
   #bind '"\C-xk": "\C-a hstr -k \C-j"'
#fi
