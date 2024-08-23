#!/bin/bash

# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html

# CSI sequence
declare E='\e['

# move cursor in DIR direction by N cells
# direction, DIR, is one of: 
# A (up), B (down), C (forward), D (back)
cursor_move () {
  declare DRN=${1:-A}
  declare CELL=${amount:-1}

  echo "${E}${CELL}${DRN}"
  echo -n "title"
}


# Alternative screen buffer (asb). Works! yey!
alt () {
  # sent a signal with "kill -signal $$"
  trap altExit RETURN

  echo "Entering alternative screen buffer…"
  echo "${E}?1049h"
  echo "Where am I"
  sleep 3
  echo "Where is this"
}

alt_exit () {
  echo "Exiting alternative screen buffer…"
  echo "${E}?1049l"
}


echo -en "\033[7A\033[1;35m BASH \033[7B\033[6D"
