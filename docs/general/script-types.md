# Scripts

There are 3 kinds of scripts in this repository: executables, functions
and sourcables; some scripts may belong to more than one category.

## Executables
A script with executable bit set that is executed like any other program, in 
its own environment, with environmental variables inherited from the parent shell. 
An executable scripts will EXIT upon completion.  
Bash executable scripts have a global pre-script hook, `BASH_ENV`, while 
Bourne-shell scripts have `ENV`. If set, the value of this environment variable
(subject to parameter expansion, command substitution, and arithmetic expansion)
is interpreted as a filename to a file that will be sourced in the same 
environment as the script about to be executed. `BASH_ENV` has to be exported 
and resultant filename has to be absolute.  

## Functions
When a file is sourced, its contents are executed in the current environment, and 
if it contains a function definition, that function will stay resident in memory 
in the current environment (TSR). Although this is the quickest way to access a 
command, functions can quicky "pollute" the environment (bash_completions). 
A function will RETURN upon completion.  

## Sourcables
Sourcables are just ordinary sourced scripts that execute in the current 
environment, but they don't contain any function definitions (that would linger 
in memory after the execution returns) and they are usually called (sourced) 
with some arguments provided, i.e. `. script --option ARG1 ARG2`. 
A sourced script will RETURN upon completion.  





