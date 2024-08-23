#!/usr/bin/env bash
#=========================================================================
# FILE: pathx.bash
# REPO: https://github.com/mandober/dotfiles
# DATE: 2017-09-10
# DESC: pathx - PATH (and similar) manipulation
#
# add dir to PATH
#   * default action
#   * if dir exists
#   * if it is not already in PATH
#
# maintenance
#   * normalize entries
#   * erase dups
#   * maintain relationship with path array
#
# remove dir from PATH
#   * if it is in PATH
#   * normalize entries
#   * erase dups
#   * maintain relationship with path array
#
# USAGE
#   pathx DIR [DIR2, ...]
#
# EXAMPLE
#   pathx $HOME/.cargo/bin
#
#=========================================================================

pathx() {

  # 1. too many params
  if (($# > 1)); then
    [[ -t 2 ]] && printf "%s\n" "At the moment, only a single folder per invocation is accepted" >&2
    return 1
  fi


  # 2. no params: just print path
  if (($# == 0)); then
     [[ -t 2 ]] && printf "%s\n" "${PATH//:/$'\n'}" >&2
    return 0
  fi


  # 3. one params:
  #    - normalize dir
  #    - check if dir exists
  #    - check if already in path

  # 3.1. normalize dir
  fxDir="$(realpath "$1")"

  # 3.1.1. feedback
  [[ -t 2 ]] && printf "%s\n" "checking folder: $fxDir" >&2

  # 3.2. check if dir exists
  if [[ ! -d "$fxDir" ]]; then
    [[ -t 2 ]] && printf "[pathx]\e[31m✗\e[0m No such directory: %s\n" "$fxDir" >&2
    return 2
  fi

  # 3.2.1. feedback
  [[ -t 2 ]] && printf "%s\n" "Ok, folder exists: $fxDir" >&2
  #[[ -t 2 ]] && printf "adding: \e[32m %s \e[0m \n" "$fxDir" >&2


  # 3.3. check if already in path
  if [[ :$PATH: =~ :$fxDir: ]]; then
    # already in PATH
    [[ -t 2 ]] && printf "[pathx]\e[31m✗\e[0m %s is already set!\n" "$fxDir" >&2
    return 2
  fi

  # 3.3.1. feedback
  [[ -t 2 ]] && printf "%s\n" "Ok, folder not in PATH: $fxDir" >&2

  # 3.3.2. append it
  PATH+=":$fxDir"

  # 3.3.2. confirm
  [[ -t 2 ]] && printf "[pathx]\e[32m✔\e[0m %s added\n" "$fxDir" >&2

  # 4. explode PATH
  local path_out
  IFS=: read -a path_out <<< $PATH

  # 4.1 remove dirs beginning with /mnt*
  local path_nowin
  path_nowin=( `echo ${out[@]##/mnt/c*}` )



  # 4. normalize PATH
  inPath="${inPath//::/:}"
  [[ $inPath =~ ^: ]] && inPath="${inPath#?}"
  [[ $inPath =~ :$ ]] && inPath="${inPath%?}"


  # 5. display PATH
  [[ -t 2 ]] && printf "%s\n" "${PATH//:/$'\n'}" >&2


  return 0
}
