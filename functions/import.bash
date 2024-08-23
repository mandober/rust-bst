#!/bin/bash
#=========================================================================
# FILE: import.bash
# REPO: https://github.com/mandober/import
# DATE: 2017-09-10
# DESC: import - enhanced file and directory sourcing
#
#    1) In case a single file is passed, it behaves like ordinary
#       source builtin;
#
#    2) In case a single directory is passed, all files contained within
#       are sourced, except for files starting with underscore. It is
#       possible to source only files with particular extension, by
#       specifying it (without a dot) as an argument to -s option:
#       import /some/dir -s sh
#
#    3) In case the parameter is `-' the input is taken from STDIN.
#       You can type the name of files or directories you want to source.
#
#    4) Pipe a list of items in order to source them. Each item must be
#       on its own line.
#
# DEPS:
#       /bin/realpath
#       /bin/find
#
# EXAMPLES:
#       import file
#       import dir
#       import --suffix bash -- dir1 dir2
#
# EXIT CODES:
#       1
#       9 no such file
#
#
#
#=========================================================================
import() {

#                                                                    ABOUT
#-------------------------------------------------------------------------
 local -r bbapp="${FUNCNAME[0]}"
 local -r bbnfo="$bbapp v.0.1.11"
 local usage="USAGE: $bbapp [-s|--suffix] [-d|--dry] FILE|DIR ..."

#                                                                     HELP
#-------------------------------------------------------------------------
 [[ $1 =~ ^(-v|--version)$ ]] && { printf "%s\n" "$bbnfo"; return 0; }
 [[ $1 =~ ^(-u|--usage)$ ]] && { printf "%s\n" "$usage"; return 0; }
 [[ $1 =~ ^(-h|--help)$ ]] && {
    printf ' %s %s\n' "$bbapp" "- source files or folders."
    echo " $usage"
    echo '
 DESCRIPTION:
    Source files or folders. Use -s option to specify file extension
    (without a dot) by which to limit files to be imported. Parameter
    consisting of "-" only, means the input is to be read from STDIN.
    One can also pipe a list of items into import in order to source
    them. Each item must be on its own line. For example:
      find . -type f | import
    In case there is a parameter "--" the rest of parameters are
    considered to be non-options i.e. files or folders, to be sourced.

 OPTIONS:
    -s, --suffix      Specify file extension by which to limit import.
    -h, --help        Show program help.
    -u, --usage       Show program usage.
    -v, --version     Show program version.'
 return 0
 }

#                                                                    SHOPT
#-------------------------------------------------------------------------
 # dotfiles are included in results of pathname expansion
 shopt -s dotglob
 # enable extended regular expressions
 shopt -s extglob
  # Enables $'' and $"" quoting
 shopt -s extquote
 # failed globbing patterns result in expansion error
 shopt -u failglob
 # double-star (**) used in a pathname expansion context will match all files and zero or more
 # directories and subdirectories. If the pattern is followed by a /, only directories and subdirectories match.
 shopt -s globstar
 # If set, bash matches filenames in a case-insensitive fashion when performing pathname expansion.
 shopt -s nocaseglob
 # If set, bash allows patterns which match no files to expand to a null string, rather than themselves.
 shopt -s nullglob
 # force C locale globbing and letter ranges
 shopt -s globasciiranges
 # case builtin case-sensitivity
 shopt -u nocasematch

 # enable globbing
 set +o noglob
trap "set +o noglob" RETURN # re-enable globbing


#                                                                    START
#-------------------------------------------------------------------------
 local bbIn=""      # input
 local -i bbRet=0   # holds return code
 local bbFile=""
 local bbOpts=""    # if params are non-canonical, call getopt
 local bbSuffix=""  # limit sourceable files to the ones with this suffix
 local -i bbDry=0   # dry run


 while (($# > 0)); do
  case $1 in

     --suffix=*) bbSuffix="${1#*=}"; shift;;
    -s|--suffix) bbSuffix="${2?"[$bbapp] Suffix is not specified."}"; shift 2;;
            -s*) bbSuffix="${1#??}"; shift;;

    -d|--dry) bbDry=1; shift;;

    --) shift; bbIn="$@"; set --;;

    -*) getopt -T # test getopt version
        (($? != 4)) && {
          [[ -t 0 ]] && echo '[getopt] cannot normalize the suplied options: do not supply compounded short options or abbreviated long options.' >&2
          return 4
        }
        local bbOpts=$(getopt -quo -s:d -l suffix:dry -- "$@")
        bbOpts="${bbOpts# }"
        bbOpts="${bbOpts// -- / }"
        bbOpts="${bbOpts/% --/}"
        # echo "getopt: \"$bbOpts\""
        eval set -- "$bbOpts"
    ;;

    *) bbIn+="$1 "; shift;;
  esac
 done

 # return operands to $@
 bbIn="${bbIn% }"
 eval set -- "$bbIn"
 bbIn=""

# debug
echo "bbSuffix: \"$bbSuffix\""
echo "bbDry: $bbDry"
for bbFile in "$@"; do
    echo "$bbFile"
done



#                                                                LIST ONLY
# ------------------------------------------------------------------------
 if ((bbDry)) && ((${BFx[stdout]})); then
    local bbItem=""
    echo "[$bbapp] Files to import:"
    for bbItem; do
        if [[ -f "$bbItem" ]]; then
            echo "$bbItem"
        elif [[ -d "$bbItem" ]]; then
            find "$bbItem" -type f
        fi
    done
    return 0
 fi


#                                                                     FILE
# ------------------------------------------------------------------------
 if [[ $# > 0 ]] && [[ -f "$1" ]]; then
    # get absolute path of file
    bbFile="$(realpath "$1")"
    # echo "sourcing a file: $bbFile" >&2
    builtin source "$bbFile" &>/dev/null
    bbRet=$?
    if ((!bbRet)); then
        [[ -t 2 ]] && printf "[\e[32m✔\e[m] %s\n" "$bbFile" >&2
    else
        [[ -t 2 ]] && printf "[\e[38;2;236;6;133m✗\e[m] %s\n" "$bbFile" >&2
    fi
    return $bbRet
 fi


#                                                                DIRECTORY
# ------------------------------------------------------------------------
 if [[ $# > 0 ]] && [[ -d "$1" ]]; then
    local bbDir
    local -a SrcFiles
    # get absolute path of directory
    bbDir="$(realpath "$1")"
    # echo "[$bbapp] sourcing directory: $bbDir" >&2
    local IFS=$'\n'
    SrcFiles=( $(find "$bbDir" -type f) )
    IFS=
    for bbFile in "${SrcFiles[@]}"; do
        $bbapp "$bbFile"
    done
    return 0
 fi

#                                                                READ PIPE
# ------------------------------------------------------------------------
 # In case STDIN is not stdout, we're piping into import, one item per line.
 # EXAMPLE: find . -type f | import
 if [[ ! -t 0 ]]; then
    while read bbFile; do
        $bbapp "$bbFile"
    done
    return 0
 fi


[[ -t 2 ]] && printf "[\e[38;2;236;6;133m✗\e[m] no such file: %s\n" "$bbFile" >&2
return 9
} # end of function
