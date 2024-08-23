# Subshell

The *current shell's instance* is easy to identify in *interactive mode* - it is (the instance of) the shell that prints the prompt; this instance could be called "the driver" as it drives the interaction with the user. After the user logs in, they are dropped at the driver shells' prompt, where they usually stay for the duration of the session. It is the driver shell that executes *internal procedures* because these procedures affect the current state of the shell. It would be futile to delegate their execution; for example, the `cd` command must be executed by the current shell (by the driver) in order to actually change the working directory. 

Current working directory (cwd) is one of the things that makes up an *execution context*, aka the *current environment* or the *current state*.




(the driver's state).


procedures that change the current state of the shell.

, but it will never execute an external procedure.


The current instance of the shell never executes external procedures itself.


It will only ever execute internal procedures. The execution of an external procedure is delegated to a subshell.

The current instance of the shell - called the parent process - will first create another instance of itself - called the child process, aka a subshell - delegating the execution of external procedures to it.

In Linux, a new process is created by forking (duplicating) the original process. Save for their PIDs, the two processes are indistinguishable. The child process (subshell) has the identical execution environment of the parent shell. This means all aliases, functions, variables (whether exported or not), that is, everything existing in the parent shell will be inherited by the child shell (there's no need to import things in the subshell, for example, to import some user function if the definition of that function was available in the parent shell).




The *execution context* of the two processes is identical, and the only thing that differentiates them is the PID number: the PID of the parent process is likely to be smaller then the child's.




A **subshell** is a new (child) shell process created by forking the original (parent) shell process.



## Execution context

Current working directory (cwd) is one of the things that makes up an 

An *execution context*, aka the *current environment* or the *current state*, is a collection of data that includes
- current working directory (cwd)
- file descriptors


## General

A shell executes external procedures in a subshell.




## Subshells in Bash

- `( … )`
- cmd &
- `$(…)`
- `<(…)`


Bash creates subshells in the following situations, but combining these constructs will result in more than one subshell:

* For exp surrounded by parentheses, `( … )` - mind the spacing. Seeing parentheses usually means a subshell is about to be created. An exception is when parentheses are used for logical grouping, like inside conditional exp, `[[ … ]]`.

In fact, surrounding an exp by parens *forces its execution in a subshell*; e.g. parenthesizing a builtin (i.e. any internal procedure) will force its execution to a subshell.

* For background execution (induced by `&` as in `cmd &`)

* For command substitution, `$(…)`

* For process substitution, `<(…)`, which typically creates 2 subshells. In case of *simple command*, prepending it with `exec (<(exec …))` will create  only one subshell.


* For every segment of a pipeline (`|`), including the first one.
  - every subshell involved is a clone of the original shell in terms of content (process-wise, subshells can be forked from other subshells, before commands are executed). 
  - Thus, modifications of subshells in earlier pipeline segments do not affect later ones. 
  - By design, commands in a pipeline are launched simultaneously - sequencing only happens through their connected stdin/stdout pipes). 
  - bash 4.2+ has shell option `lastpipe` (off by default), which causes the 
    last pipeline segment to _not run in a subshell_.
