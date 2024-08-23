

#| Is this an interactive shell?
is_ia () {
  if [[ -n $PS1 ]]; then
    echo 'interactive' >&2
    return 0
  else
    echo 'not interactive' >&2
    return 1
  fi
}


#| Is this an interactive shell?
is_interactive () {
  if [[ $- != *i* ]]; then
    echo 'not interactive' >&2
    return 1
  else
    echo 'interactive' >&2
    return 0
  fi
}

has_stdout () {
  if [[ -t 1 ]]; then
    return 0
  else
    return 1
  fi
}

has_stderr () {
  [[ -t 2 ]] && return 0 || return 1
}

has_util () {
  command -v $1 &>/dev/null
  declare retcode=$?
  if [[ -z $retcode ]]; then
    echo "utility $1 present" >&2
  else
    echo "utility $1 NOT present" >&2
  fi
} >&2


