# Procedure
(generic term)

"Procedure" is a light-weight replacement for the old "command", which comes with too much baggage.

A **procedure** is any action that has some observable result.

This definition is "like that" becasue I want command to encompass the lot: aliases, functions, keywords, builtins, programs, sourceables, etc.


Commonly case, a command is a shell-word, typed at the prompt by the user on the command line; if the user's intention was to run the program whose name matches the typed command, 

after being processed by the shell, 


In brief, a shell only ever handles procedures:
- in case of internal procedures, it executes them itself
- in case of external procedures, it delegates their execution to a subshell



(ad hoc) aimed to replace the  which is too overloaded. It doesn't have to if we can manage to use the term "command" appropriately.

"Command" should mean anything 
