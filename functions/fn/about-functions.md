# About bash user functions

## Namespace

All user functions are prefixed with u:
and further namespaced by ns: where ns is one of
- is    `is_*` predicates
- has   `has_*` predicates
- arr   `arr_*` array-related functions

## Conventions

The args to functions can be short and/or long.
- options
  - both short and long options may take arguments, e.g.
  - -o$HOME/dots/
  - -o $HOME/dots/
  - -o=$HOME/dots/
  - --output $HOME/dots/
- arg
- optional arg
- short options
  - use single dash prefix, e.g. -a
  - multiple options may be compacted, e.g. -ap
  - options that take an arg must be given last if compacted (per compacted unit)
    - `-po/opt` is the same as `-p -o/opt` or `-p -o=/opt`
- long options
  - use double dash, e.g. --output
  - may be abbreviated as long as they remain unambiguous
    - `--verbose` amy be written as `--verbos` or `--verbo` or `--verb`
      but not `--ver` if there is also a long option `--veracity`


## Passing values around

Normally, values are passed around as strings. 
The callee (function, program) outputs a string (either to stdoput or stderr)
as its return value, and the caller (function, porgram) captures it.
This is the way piping (and redicrection in general) works in unix shell.
That is, functions cannot return anything but a *return/exit status code*.
Functions have return codes, programs have exit codes, but such code is just
an 8-bit unsigned number (0-255). The code 0 indicates success, all other 
codes (numbers) indicate an error. There is no completely standardized way as
to what an error code represents, although some error codes do have a usual
interpretation, especially when limited to a particular program (bash has some
conventions for what the different error codes mean).

The problem with this, emit-and-capture scheme of passiong values, is that it is terribly slow. 
Even bash often uses an alternative scheme, "injection", in which a bash builtin injects the 
output into a predefined variable (e.g. REPLY, BASH_MATCH, etc.). For example, if the `read` 
bash builtin is not given a name for the variable, the read content is stored in `REPLY`.
This scheme requires either having a bunch of predefined variables, each with a particular 
purpose and associated with a particular function, or passing values by reference (which 
bash supports for both plain and array variables).



## Tips

print where a fn is defined (use subshell):

```bash
echo $(shopt -s extdebug && declare -F srcdir)

complete -W "opt1 opt2 word3" myFunction
```

More involved completion:

```bash
_myProgram()
{
  cur=${COMP_WORDS[COMP_CWORD]}
  case "${cur}" in
    d*) use="doSomething" ;;
    n*) use="nowDoSomethingElse" ;;
  esac
  COMPREPLY=( $( compgen -W "$use" -- $cur ) )
}
complete -o default -o nospace -F _myProgram  myProgram
```


## Ideas

bash history sensitive to cwd
https://stackoverflow.com/questions/945288/saving-current-directory-to-bash-history



