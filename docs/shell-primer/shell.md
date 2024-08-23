# Shell

https://en.wikipedia.org/wiki/Shell_(computing)
https://en.wikipedia.org/wiki/Unix_shell

In 1964, for the Multics OS, Louis Pouzin conceived the idea of "using commands somehow like a programming language", and coined the term "shell" to describe it: "The purpose of such a procedure is to create a medium of exchange into which one could activate any procedure, as if it were called from the inside of another program. Hereafter, for simplification, we shall refer to that procedure as the SHELL". -- Louis Pouzin, "The SHELL: A Global Tool for Calling and Chaining Procedures in the System", 1964.

In a 1965 document, shell is defined as a common procedure called automatically by the supervisor whenever a user types in some message at the console, at a time when no other process is in active execution (under the console's control). This procedure acts as an interface between console messages and subroutine in the supervisor.

*Multics shell* had also introduced *active function*, a key concept in all later shells, defined as a string, that gets replaced by a character string return value before the command line containing it is executed. Active functions are often used to implement *command-language* macros. (from 1983's "Multics Common Commands" manual).

In 1971, Ken Thompson developed the *Thompson shell* in the first version of Unix. While simpler than the Multics shell, it contained some innovative features that are still present today, like the use of characters `<` and `>` for redirection (in this role called **metacharacters**).
