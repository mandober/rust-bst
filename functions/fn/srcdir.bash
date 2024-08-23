#|================================================================= source dir
u:srcdir () {
  # If not running interactively, bail out
  #[[ $- != *i* ]] && return

  echo "srcdir function called"

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



