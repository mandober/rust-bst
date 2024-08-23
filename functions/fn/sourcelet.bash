#|===========================================================================
#| file name: sourcelet.bash
#| desc: Testing to see what can be achieved in a file that is only sourced
#|       without defining a function. A function defined in a sourced file
#|       stays in the env, but soucing a (function-less) file is a one-shot
#|       command. In fact, it is a command that can affect the current env,
#|       just like functions can.
#|
#|       In fact, functions and "sourcelets" are seemingly both able to
#|       - accept positional params
#|         $ . ~/dots/fn/srcfu.bash 1 2 3
#|       - stop execution arbitrarily ('return', 'break', 'continue')
#|
#|       Additinally
#|       - sourcelet whose parent dir is in PATH can be sourced by name only
#|       - sourcelet can be sourced or executed
#|
#|===========================================================================

# sourced or executed?
[[ ${BASH_SOURCE[0]} != $0 ]] && echo "[i] sourced" || echo "[i] executed"

# is shell interactive?
[[ $- != *i* ]] && echo "[i] interactive" || echo "[i] noninteractive"

# do we have stdin?
[[ -t 0 ]] && echo "[+] stdin" || echo "[-] no stdin"

# do we have stdout?
[[ -t 1 ]] && echo "[+] stdout" || echo "[-] no stdout"

# do we have stderr?
[[ -t 2 ]] && echo "[+] stderr" || echo "[-] no stderr"

# print some info
echo "[i] \${BASH_SOURCE[0]} is ${BASH_SOURCE[0]}"
echo "[i] \${BASH_SOURCE[1]} is ${BASH_SOURCE[1]}"
echo "[i] \${FUNCNAME[0]} is ${FUNCNAME[0]}"
echo "[i] \${FUNCNAME[1]} is ${FUNCNAME[1]}"
# special params
echo "[i] \$* is $*"
echo "[i] \$@ is $@"
echo "[i] \$# is $#"
echo "[i] \$? is $?"
echo "[i] \$- is $-"
echo "[i] \$$ is $$"
echo "[i] \$! is $!"
echo "[i] \$0 is $0"
# shell params
echo "[i] \$SHLVL is $SHLVL"
echo "[i] \$PPID is $PPID"

# if no stdin, sourcelet is in a pipeline
if [[ ! -t 0 ]]; then
  echo "[i] in a pipeline"
  while read fx; do
    echo "[+] line is $fx"
  done
fi


