# vim: filetype=readline

# includer.rl

#| This file includes various readline-related files.
#| In fact, this list of included files should be placed
#| in ~/.inputrc file, minding the conditionals.
#|
#| Instead, to include a file directly from bash:
#|    bind -f ~/dots/readine/readline_vars.bash

# Readline variables (options)
$include ~/dots/readine/init/options.rl

# Readline functions
$include ~/dots/readine/init/functions.rl

# Readline macros
$include ~/dots/readine/init/macros.rl
