
#| msg - print a message to stderr (if stderr is available)
#|
#| msg 0 "success message"
#| msg 1 "error message"
#| msg 2 "info message"
#|
msg () {
  if [[ -t 2 ]]; then
    case "$1" in
      0) echo "first arg is 0"
         printf "[\e[32m OK \e[0m] %s\n" "$2" >&2
      ;;
      5) echo "first arg is 5"
         printf "[\e[32m 🗸 \e[0m] %s\n" "$2" >&2
      ;;
      1) echo "first arg is 1"
         printf "[\e[31m ERR \e[0m] %s\n" "$2" >&2
      ;;
      6) echo "first arg is 6"
         printf "[\e[31m✘\e[0m] %s\n" "$2" >&2
      ;;
      2) echo "first arg is 2"
         printf "[\e[34m INFO\e[0m] %s\n" "$2" >&2
      ;;
      7) echo "first arg is 7"
         printf "[\e[34m 🛈 \e[0m] %s\n" "$2" >&2
      ;;
    esac
  fi
}

msg 0 "great success"
msg 5 "graphical great success"
msg 1 "catastrophic failure"
msg 6 "graphical failure"
msg 2 "info"
msg 7 "infographic"

