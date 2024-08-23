# Commands


It is not easy to define what a command is in a shell environment.
A command could be any shell word, typed by the user on the command line, that has an associated interpretation with immediate consequences.

A **shell builtin** is a command internal to the shell. A builtin is executed by the shell in the current, invoking, context (environment), which means builtins can change some aspects of the current (shell) environment. On the other hand, **external commands**, i.e. programs located somewhere on the file system like in /bin, are always executed in a *subshell*, meaning they can never affect the *current environment* (current execution context).



one that is processed internally by the shell.



A canonical example of a command is an external binary executable located somewhere on a filesystem (such as in /bin), which may be invoked merely by typing its name on the command line thanks to the PATH resolution.

, provided its containing directory is in the PATH.


A command is any meaningful shell word. 
typing 

Command is any meaningful shell word like an shell keyword, alias, shell function, etc. In the sense of being an executable, it always executes in a subshell, i.e. in a new (child) shell environment.
