# check-path.bash

function checkpath {
  # make additions to PATH omnipotent

  # default PATH on Ubuntu 22.05 (under WSL)
  local -A defpath=(
         [sbin1]=/usr/local/sbin
          [bin1]=/usr/local/bin
         [sbin2]=/usr/sbin
          [bin2]=/usr/bin
         [sbin3]=/sbin
          [bin3]=/bin
        [games1]=/usr/games
        [games2]=/usr/local/games
           [wsl]=/usr/lib/wsl/lib
          [snap]=/snap/bin
  )

  # dirs to add to PATH
  local -A udirs=( 
           [cwd]=.
          [ubin]=$HOME/.local/bin
         [cabal]=$HOME/.cabal/bin
         [ghcup]=$HOME/.ghcup/bin
     [luarocks1]=$HOME/.luarocks/bin/
     [luarocks2]=/usr/local/lib/luarocks/bin/
  )

  # feedback
  printf '%s\n' ${defpath[@]}
  echo '-------------------------------------'
  printf '%s\n' ${udirs[@]}


  # ========================================================================
  # new dirs to be added to PATH are listed in ~/dots/fs/upath.conf
  # check each new against those already in PATH
  # such that adding a new entry is omnipotent.
  # ========================================================================




  # assemble $defpath array as colon-sep string
  printf '%s:' ${defpath[*]}


  local -n i
  local put
  for i in ${!defpath[@]}; do
    printf -v put '%s:' ${defpath[$i]}
  done

  echo "$put"

  #case ":$PATH:" in
  #  *:"/home/ivan/.ghcup/bin":*)
  #  ;;
  #  *)
  #  export PATH="/home/ivan/.ghcup/bin:$PATH"
  #  ;;
  #esac
}
