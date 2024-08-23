#|===========================================================================
#|
#|
#|
#|
#|
#|===========================================================================
load () {
  # is the shell interactive
  [[ $- != *i* ]] && echo "[+] interactive :)" || echo "[+] noninteractive :("


  # if we don't have stdin, we are piped into
  [[ -t 0 ]] && echo "[+] we have stdin" || echo "[+] we are piped into"
  [[ -t 1 ]] && echo "[+] we have stdout"
  [[ -t 2 ]] && echo "[+] we have stderr"

  echo "[+] \${BASH_SOURCE[0]} is ${BASH_SOURCE[0]}"
  echo "[+] \$* is $*"
  echo "[+] \$@ is $@"
  echo "[+] \$# is $#"
  echo "[+] \$? is $?"
  echo "[+] \$- is $-"
  echo "[+] \$$ is $$"
  echo "[+] \$! is $!"
  echo "[+] \$0 is $0"

  echo "[+] \$SHLVL is $SHLVL"
  echo "[+] \$PID is $PID"
  echo "[+] \$PPID is $PPID"


  # if we are piped into
  #  if [[ -t 0 ]]; then
    #  read f 
  #  fi




  return


  # turn on globbing
  shopt -s extglob extquote

  local dir="$HOME/.dotfiles.d"

  if [[ -d $dir ]]; then
    echo "dir to source: $dir"
    for file in $dir/*; do

      # ...if a file is readable
      if [[ -r "$file" ]]; then

         # ...if a file doesn't start with the underscore
         if [[ ! $(basename "$file") =~ ^_ ]]; then

           # ...then source the file
           #builtin source "$file" 2> /dev/null
           echo "sourcing: $dir/$file"

           # feedback
	   local bbRet=$?
           if [[ $bbRet == 0 ]]; then
             printf "[\e[32m✔\e[0m] %s\n" "$file" >&2
           else
             printf "[\e[35m✗\e[0m] %s [%s]\n" \
               "error sourcing: $file" "$bbRet" >&2
           fi

         else
           printf "[\e[35m✗\e[0m] %s\n" "skipped: $file" >&2
         fi
    
      else
        printf "[\e[35m✗\e[0m] %s\n" "not readable: $file" >&2
      fi

    done
  fi
}

#  echo "[+] 'load.bash' file sourced"
#  echo "[+] 'load' function now available"

#| Completions for the load function
#| ...


if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  echo "[+] we are being sourced"
else
  echo "[+] we are being executed"
fi

echo "[+] \${BASH_SOURCE[0]} is ${BASH_SOURCE[0]}"
echo "[+] \$* is $*"
echo "[+] \$@ is $@"
echo "[+] \$# is $#"
echo "[+] \$? is $?"
echo "[+] \$- is $-"
echo "[+] \$$ is $$"
echo "[+] \$! is $!"
echo "[+] \$0 is $0"

echo "[+] \$SHLVL is $SHLVL"

