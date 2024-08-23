# Shartefacts :: Glossary

## TUI
In computing, text-based user interfaces (TUI) (alternately terminal user interfaces, to reflect a dependence upon the properties of computer terminals and not just text), is a retronym describing a type of user interface (UI) common as an early form of human–computer interaction, before the advent of bitmapped displays and modern conventional graphical user interfaces (GUIs). Like modern GUIs, they can use the entire screen area and may accept mouse and other inputs. They may also use color and often structure the display using box-drawing characters such as ┌ and ╣. The modern context of use is usually a terminal emulator.

## Whitespace
- SPACE
- TAB (`\t`)
- VTAB (`\v`)
- NEWLINE (`\n`)
- FormFeed (`\f`)
- CarrageReturn (`\r`)
- Unicode whitespace

## Blank character
SPACE or TAB.

## Shell-word
A sequence of characters considered as a single unit by the shell. Also known as a token.

## Shell-name
A word consisting only of alphanumeric characters and underscores and beginning with an alphabetic character or an underscore; aka *identifier*.

## Metacharacter
A character that, when unquoted, separates words. One of the following:

    |  & ; ( ) < > space tab newline

## Control operator
A token that performs a control function - one of the following symbols:

    || & && ; ;; ;& ;;& ( ) | |& <newline>

## Reserved words
Reserved words are words that have a special meaning to the shell. 
The following words are recognized as reserved when unquoted and either
- the 1st word of a command
- the 3rd word of a `case` or `select` command (only `in` is valid)
- the 3rd word of a `for` command (only `in` and `do` are valid)

    ! case  coproc  do done elif else esac fi for function if in select then until while { } time [[ ]]

## Return status

## Exit code

## Commmand types
- simple command
- pipeline
- list
- compound commands
    (list)
    { list; }
    ((expression))
    [[ expression ]]


## Commmand
An action, something like an external program executed in a subshell, or a builtin executed in the same shell environment. Also aliases and shell functions. Sourceable files (in the PATH) as well.

Basically, we can think of procedures instead of commands, then divide them into internal procedures that execute in the same shell environment, and external procedures that execute in a subshell.

*Internal procedures* would then include shell aliases, shell functions, shell builtins and sourceables.

*External procedures* would include programs available in the PATH, as well as all internal procedures that are forced to execute in a subshell.

## Shell execution
Execution happens either in the current shell environment or in a subshell. External procedures are executed in a subshell, which is a new (child) shell process forked from the current (parent) shell process. The child shell process gets a copy of the parent's environment, so changes made there cannot influence the parent shell. However, some commands need to change the current environment so they cannot be relaized as external procedures. The canonical example of such commands is the change directory, `cd`, which may be executed in a subshell to no effect on the parent shell. Such commands are realized as shell builtins. Builtins are commands internal (integrated) to the shell, and bash has the builtins `enable` and `disable` which are used to turn on or off the builtins. It is also possible to program custom builtins, most readily in C (bash source distribution has some examples). The builtin `builtin` makes sure the shell word is interpreted as a bash builtin, as opposed to an alias, which are resolved before builtins.

The order of precedence of namespaces
- shell alias
- shell functions
- shell keyword
- shell builtins
- external commands

## Shell word
A shell word is a single character or a sequence of characters with a meaning to the shell. When the user types sopmething at the prompt and submits it (by pressing RET or C-M or C-J), the text that makes the comman line is tyreated as a raw input and it gets processed in several *stages* by the shell.

## Shell builtin

## Positional parameter
A positional parameter is a parameter denoted by one or more digits, other than the single digit 0. Positional parameters are assigned from the shell's arguments when it is invoked, and may be reassigned using the `set` builtin command. Positional parameters may not be assigned to with assignment statements. The positional parameters are temporarily replaced when a shell function is executed. When a positional parameter consisting of more than a single digit is expanded, it must be enclosed in braces.

## Special parameter
The shell treats several parameters specially. These parameters may only be referenced; assignment to them is not allowed:

    * @ $ # - ! ? 0

## Shell variables

## Bash variables

## Env variables

## Expansion
Expansion is performed on the command line after it has been split into words. There are 7 kinds of expansion performed:
- brace expansion
- tilde expansion
- parameter and variable expansion
- command substitution
- arithmetic expansion
- word splitting
- pathname expansion

The order of expansions is:
- brace expansion
- tilde expansion
- parameter and variable expansion
- arithmetic expansion
- command substitution
- word splitting
- pathname expansion
- process substitution
- quote removal

After these expansions are performed, quote characters present in the original word are removed unless they have been quoted themselves.

Only brace expansion, word splitting, and pathname expansion can increase the number of words of the expansion; other expansions expand a single word to a single word. The only exceptions to this are the expansions of `"$@"` and `"${name[@]}"`, and, in most cases, `$*` and `${name[*]}`.

## Pattern matching

## Redirection

## Conditional expression

## Command execution
After a command has been split into words, if it results in a simple command and an optional list of arguments, the following actions are taken.

If  the  command name contains no slashes, the shell attempts to locate it.  If there exists a shell function by that name, that function is invoked as
described above in FUNCTIONS.  If the name does not match a function, the shell searches for it in the list of shell builtins.  If a  match  is  found,
that builtin is invoked.

If  the  name  is neither a shell function nor a builtin, and contains no slashes, bash searches each element of the PATH for a directory containing an
executable file by that name.  Bash uses a hash table to remember the full pathnames of executable files (see hash under SHELL BUILTIN COMMANDS below).
A  full  search  of  the directories in PATH is performed only if the command is not found in the hash table.  If the search is unsuccessful, the shell
searches for a defined shell function named command_not_found_handle.  If that function exists, it is invoked in a separate execution environment  with
the  original  command  and the original command's arguments as its arguments, and the function's exit status becomes the exit status of that subshell.
If that function is not defined, the shell prints an error message and returns an exit status of 127.

If the search is successful, or if the command name contains one or more slashes, the shell executes the named program in a separate execution environ‐
ment.  Argument 0 is set to the name given, and the remaining arguments to the command are set to the arguments given, if any.

If  this execution fails because the file is not in executable format, and the file is not a directory, it is assumed to be a shell script, a file con‐
taining shell commands.  A subshell is spawned to execute it.  This subshell reinitializes itself, so that the effect is as if a new shell had been in‐
voked  to  handle  the script, with the exception that the locations of commands remembered by the parent (see hash below under SHELL BUILTIN COMMANDS)
are retained by the child.

If the program is a file beginning with #!, the remainder of the first line specifies an interpreter for the program.  The shell executes the specified
interpreter  on  operating systems that do not handle this executable format themselves.  The arguments to the interpreter consist of a single optional
argument following the interpreter name on the first line of the program, followed by the name of the program, followed by the  command  arguments,  if
any.

## Command execution environment
The shell has an execution environment, which consists of the following:

•      open files inherited by the shell at invocation, as modified by redirections supplied to the exec builtin

•      the current working directory as set by cd, pushd, or popd, or inherited by the shell at invocation

•      the file creation mode mask as set by umask or inherited from the shell's parent

•      current traps set by trap

•      shell parameters that are set by variable assignment or with set or inherited from the shell's parent in the environment

•      shell functions defined during execution or inherited from the shell's parent in the environment

•      options enabled at invocation (either by default or with command-line arguments) or by set

•      options enabled by shopt

•      shell aliases defined with alias

•      various process IDs, including those of background jobs, the value of $$, and the value of PPID

When  a simple command other than a builtin or shell function is to be executed, it is invoked in a separate execution environment that consists of the
following.  Unless otherwise noted, the values are inherited from the shell.

•      the shell's open files, plus any modifications and additions specified by redirections to the command

•      the current working directory

•      the file creation mode mask

•      shell variables and functions marked for export, along with variables exported for the command, passed in the environment

•      traps caught by the shell are reset to the values inherited from the shell's parent, and traps ignored by the shell are ignored

A command invoked in this separate environment cannot affect the shell's execution environment.

Command substitution, commands grouped with parentheses, and asynchronous commands are invoked in a subshell environment that is  a  duplicate  of  the
shell  environment, except that traps caught by the shell are reset to the values that the shell inherited from its parent at invocation.  Builtin com‐
mands that are invoked as part of a pipeline are also executed in a subshell environment.  Changes made to the subshell environment cannot  affect  the
shell's execution environment.

Subshells spawned  to execute command substitutions inherit the value of the -e option from the parent shell.  When not in posix mode, bash clears the
-e option in such subshells.

If a command is followed by a & and job control is not active, the default standard input for the command is the empty file /dev/null.  Otherwise,  the
invoked command inherits the file descriptors of the calling shell as modified by redirections.

## ENVIRONMENT
When a program is invoked it is given an array of strings called the environment.  This is a list of name-value pairs, of the form name=value.

The  shell  provides  several  ways to manipulate the environment.  On invocation, the shell scans its own environment and creates a parameter for each
name found, automatically marking it for export to child processes.  Executed commands inherit the environment.  The export and declare -x commands al‐
low  parameters  and  functions  to  be added to and deleted from the environment.  If the value of a parameter in the environment is modified, the new
value becomes part of the environment, replacing the old.  The environment inherited by any executed command consists of the shell's  initial  environ‐
ment,  whose  values  may  be modified in the shell, less any pairs removed by the unset command, plus any additions via the export and declare -x com‐
mands.

The environment for any simple command or function may be augmented temporarily by prefixing it with parameter assignments, as described above  in  PA‐
RAMETERS.  These assignment statements affect only the environment seen by that command.

If the -k option is set (see the set builtin command below), then all parameter assignments are placed in the environment for a command, not just those
that precede the command name.

When bash invokes an external command, the variable _ is set to the full filename of the command and passed to that command in its environment.

## EXIT STATUS
The exit status of an executed command is the value returned by the waitpid system call or equivalent function.  Exit statuses fall between 0 and  255,
though,  as explained below, the shell may use values above 125 specially.  Exit statuses from shell builtins and compound commands are also limited to
this range.  Under certain circumstances, the shell will use special values to indicate specific failure modes.

For the shell's purposes, a command which exits with a zero exit status has succeeded.  An exit status of zero indicates success.  A non-zero exit sta‐
tus indicates failure.  When a command terminates on a fatal signal N, bash uses the value of 128+N as the exit status.

If  a  command  is not found, the child process created to execute it returns a status of 127.  If a command is found but is not executable, the return
status is 126.

If a command fails because of an error during expansion or redirection, the exit status is greater than zero.

Shell builtin commands return a status of 0 (true) if successful, and non-zero (false) if an error occurs while they execute.  All builtins  return  an
exit status of 2 to indicate incorrect usage, generally invalid options or missing arguments.

Bash itself returns the exit status of the last command executed, unless a syntax error occurs, in which case it exits with a non-zero value.  See also
the exit builtin command below.

## SIGNALS
When bash is interactive, in the absence of any traps, it ignores SIGTERM (so that kill 0 does not kill an interactive shell), and SIGINT is caught and
handled  (so that the wait builtin is interruptible).  In all cases, bash ignores SIGQUIT.  If job control is in effect, bash ignores SIGTTIN, SIGTTOU,
and SIGTSTP.

Non-builtin commands run by bash have signal handlers set to the values inherited by the shell from its parent.  When job control  is  not  in  effect,
asynchronous  commands  ignore SIGINT and SIGQUIT in addition to these inherited handlers.  Commands run as a result of command substitution ignore the
keyboard-generated job control signals SIGTTIN, SIGTTOU, and SIGTSTP.

The shell exits by default upon receipt of a SIGHUP.  Before exiting, an interactive shell resends the SIGHUP to all jobs, running or stopped.  Stopped
jobs  are  sent SIGCONT to ensure that they receive the SIGHUP.  To prevent the shell from sending the signal to a particular job, it should be removed
from the jobs table with the disown builtin (see SHELL BUILTIN COMMANDS below) or marked to not receive SIGHUP using disown -h.

If the huponexit shell option has been set with shopt, bash sends a SIGHUP to all jobs when an interactive login shell exits.

If the huponexit shell option has been set with shopt, bash sends a SIGHUP to all jobs when an interactive login shell exits.

If bash is waiting for a command to complete and receives a signal for which a trap has been set, the trap will not be executed until the command  com‐
pletes.   When bash is waiting for an asynchronous command via the wait builtin, the reception of a signal for which a trap has been set will cause the
wait builtin to return immediately with an exit status greater than 128, immediately after which the trap is executed.
