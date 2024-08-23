COMMANDS
- BUILTIN

COMMAND

SHELL BUILTIN
A shell builtin, or just builtin, is a command internal to the shell, as opposed to the external programs located in a PATH-included directory, such as /bin. The crucial difference is builtins are by default executed in the same shell environment, unlike external programs which are always executed in a subshell, thus having no effect on the current, invoking, shell. Commands that must change the current environment are realized as builtins. For example, a command that changes the current directory, `cd`, cannot ever be an external command. Such a program would be futile - it would change the cwd in a subshell that is discarded as soon as it finishes.

COMMANDS
- external commands
- internal commands
- builtins

EXTERNAL COMMANDS
External commands are programs and executable (chmod +x $FILE) scripts, 

EXECUTABLES
Executables are compiled binary files (binaries) and shell scripts with the executable bit set (chmod +x $FILE).



Changing the current directory would only affect the discarded subshell, not the parent shell that invoked the command.


The most important difference 
between external programs binaries and shell builtins 

is that the external executables 
latter execute in the same shell environment, 
unlike the former which are always executed 


that, by default, executes in the current shell environment. However, the execution can be forced to take place in a subshell.

commands integrated into the shell itself
