# Trap
(generic term, specific term, bash builtin)

The builtin `trap` is used for catching (trapping) signals.

>trap [-lp] [[ARG] SIGNAL_SPEC …]

`trap` defines and activates *handlers*, which are command (commonly bash functions) executed when the associated sognal(s) are received.

`trap -l`
  Show a list of signal names and their corresponding numbers

`trap -p SIGNAL_SPEC …`
  Show trap command associated with each SIGNAL_SPEC


>trap [[ARG] SIGNAL_SPEC …]
- `ARG`
- `SIGNAL_SPEC`







`ARG` is a command to be read and executed when the shell receives the signal(s) `SIGNAL_SPEC`.

If ARG is absent or `-`, and a single SIGNAL_SPEC is supplied, each specified signal is *reset* to its original value.

If ARG is the null string, each SIGNAL_SPEC is *ignored* by the shell and by the commands it invokes.

- If SIGNAL_SPEC is `EXIT` or `0`, ARG is executed on exit from the shell.
- If SIGNAL_SPEC is `DEBUG`, ARG is executed before every simple command.
- If SIGNAL_SPEC is `RETURN`, ARG is executed each time a shell function or a sourceable file finishes executing.


A SIGNAL_SPEC of ERR means to execute ARG each time a command's failure would cause the shell to exit when the -e option is enabled.


If no arguments are supplied, trap prints the list of commands associated with each signal.

Options:
-l        print a list of signal names and their corresponding numbers
-p        display the trap commands associated with each SIGNAL_SPEC

Each SIGNAL_SPEC is either a signal name in <signal.h> or a signal number. Signal names are case insensitive and the SIG prefix is optional. A signal may be sent to the shell with "kill -signal $$".

Exit Status:
Returns success unless a SIGSPEC is invalid or an invalid option is given.
