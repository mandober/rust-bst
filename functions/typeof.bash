#!/bin/bash
#=============================================================================
# FILE: typeof
# TYPE: bash function
# EDIT: 2017-10-05
# NAME: typeof - qualify input, type and dump variable.
#
# SYNOPSIS:
#       typeof [-b|--brief] NAME
#
# DESCRIPTION:
#       This utility will qualify the operand NAME as:
#         - scalar (scalar variable)
#         - indexed (indexed array)
#         - associative (associative array)
#         - unset (if NAME is not a set var or not a meaningful name)
#         - function
#         - file
#         - builtin
#         - alias
#         - keyword
#       It is particulary useful for pretty printing arrays: their type,
#       value and attributes. Variable names should be supplied by name
#       only (without $).
#
# OPTIONS:
#       -b, --brief
#       Return the type, as single word.
#
# OPERAND:
#       NAME
#       A word, a name, an identifier, a token, etc.
#
# STDOUT:
#       Type, value and attributes of the parameter.
#
# STDERR:
#       Error messages, help and usage.
#
# RETURN CODE:
#       0  success
#       1  failure
#       2  NAME has no meaning
#
# NOTES:
#       Best used when sourced. It can be executed as well, but than it
#       will run in its own, separate environment, so current shell
#       varables won't be available (unless exported).
#
# EXAMPLES:
#       typeof BASH_VERSINFO       # pretty prints the array
#       typeof -b BASH_VERSINFO    # outputs: "associative"
#
# DEPENDENCIES:
#       none (bash only)
#
# SEE ALSO:
#       type (bash builtin)
#
# REPO: https://github.com/mandober/typeof
# AUTHOR: Ilic Ivan <ilicivan@zoho.com>
# LICENSE: MIT
#
#=============================================================================
typeof() {

#                                                                        ABOUT
#-----------------------------------------------------------------------------
 local bbapp="${FUNCNAME[0]}"
 local bbnfo="$bbapp v.0.1.12"
 local usage="USAGE: $bbapp [-b] NAME ..."

#                                                                         HELP
#-----------------------------------------------------------------------------
 [[ $1 =~ ^(-u|--usage)$ ]] && { printf "%s\n" "$usage"; return 0; }
 [[ $1 =~ ^(-v|--version)$ ]] && { printf "%s\n" "$bbnfo"; return 0; }

 [[ $1 =~ ^(-h|--help)$ ]] && {
  printf "\e[7m%s\e[0m\n" "$bbnfo"
  printf "\e[1m%s\e[0m\n" "$usage"
  cat <<-EOFF
	Variable typing and dumping.

	DESCRIPTION:
	  Pass an identifier (without \$), name or word NAME to
	  check its type and dump its value and attributes.
	  With -b option, only the type, as a single word, is
	  returned. Returned types are:
	   - 'unset' for unset variables
	   - 'associative' for associative arrays
	   - 'indexed' for indexed arrays
	   - 'scalar' for set varables
	   - 'alias', 'keyword', 'function', 'builtin' or 'file'

	OPTIONS:
	   -b, --brief       Return type as a single word.
	   -h, --help        Show program help.
	   -u, --usage       Show program usage.
	   -v, --version     Show program version.

	EXAMPLES:
	   $bbapp -b BASH_ALIASES
	   $bbapp BASH_VERSINFO
	EOFF
	return 0
 }

#                                                                          SET
#-----------------------------------------------------------------------------
 shopt -s extglob         # Enable extended regular expressions
 shopt -s extquote        # Enables $'' and $"" quoting
 shopt -u nocasematch     # regexp case-sensitivity
 set -o noglob            # Disable globbing (set -f).
 # . options extglob extquote noglob +nocasematch
 trap "set +o noglob" RETURN EXIT # re-enable globbing


#                                                                      OPTIONS
#=============================================================================
 local bbIn=""       # input parameter
 local bbBrief=0     # output verbosity: 0=verbose, 1=single word
 local bbDeclare=""

 # parse input args
 while (($# > 0)); do
  case $1 in
    -b|-t|--brief) bbBrief=1; shift;;
             *) bbIn="$1"; shift;;
  esac
 done

 # formats for printf
 local bbDim=" \e[2m%s\e[0m %s\n"
 local bbDim1="\e[2m%s\e[0m\n"
 local dim="\e[2m%s\e[0m"

 # get nr. of terminal columns
 local -i bbCols=${COLUMNS:-$(tput cols)}
 ((bbCols <= 1)) && bbCols=80

#                                                                PRINT ALL
#=========================================================================
 # If no arg supplied print all variables and functions
 if [[ -z $bbIn ]]; then
  printf "$bbDim1" "Variables:"
  compgen -v | column -c $bbCols
  printf "\n$bbDim1" "Functions:"
  compgen -A function | grep -v _ | column -c $bbCols
  printf "\n$bbDim1" "All functions:"
  compgen -A function | column -c $bbCols
  return 0
 fi

#                                                                     VARS
#=========================================================================
 # First, check if name is a variable name, i.e. in symbols table
 if bbDeclare="$(declare -p "$bbIn" 2>/dev/null)"; then
    # NAME is var: scalar, indexed or assoc. array

    # get attrib part from declare statement, e.g: declare -xr VAR
    # NOTE: In bash 4.4+. these atribs can be obtained: ${NAME@a}
    bbDeclare=($bbDeclare)

    # Check attributes (-linuxAcart):
    #  * type: scalar (-) OR indexed (a) OR assoc. array (A).
    #  * casing: uppercase (u), lowercase (l), titlecase (c).
    #  * other: integer (i), ref (n), export (x), readonly (r), trace (t).
   case ${bbDeclare[1]} in

    #                                                        INDEXED ARRAY
    #=====================================================================
     *a*)
        if ((bbBrief)); then
          # brief output
          printf "%s\n" "indexed"
          return 0
        else
          # verbose output
          local bbKey bbK bbCurr bbMax=0
          local -n bbArrayRef="$bbIn"
          local -i bbNum=1

          # max chars
          for bbKey in "${!bbArrayRef[@]}"; do
            bbCurr=${#bbArrayRef[$bbKey]}
            bbMax=$(( bbCurr > bbMax ? bbCurr : bbMax ))
          done

          # OUTPUT
          printf " $dim %s\n" "Name:" "$bbIn"
          printf " $dim " "Type:"
          printf "indexed array [%s]\n" "${#bbArrayRef[@]}"

          # title
          printf "\e[2m%s. %7s %-*s %5s\e[0m\n" \
                " no" "key " $bbMax "value" "len"

          # value
          for bbK in "${!bbArrayRef[@]}"; do
            printf "\e[2m%2d.\e[0m %7s: %-*s \e[2m%5s\e[0m\n" \
                  "${bbNum}" "[${bbK}]" $bbMax \
                  "${bbArrayRef[$bbK]}" "${#bbArrayRef[$bbK]}"
            (( ++bbNum ))
          done
          printf "\n"
        fi
     ;;&

    #                                                    ASSOCIATIVE ARRAY
    #=====================================================================
     *A*) # brief output:
        if ((bbBrief));then
          printf "%s\n" "associative"
          return 0
        else
          # verbose output:
          local -n bbArrayRef="$bbIn"
          local -i bbNum=1
          local bbKey bbCurr bbMax=0 bbCurrKey bbMaxK=0

          # max chars: value and kay
          for bbKey in "${!bbArrayRef[@]}"; do
            bbCurr=${#bbArrayRef[$bbKey]}
            bbMax=$(( bbCurr > bbMax ? bbCurr : bbMax ))
            bbCurrKey=${#bbKey}
            bbMaxK=$(( bbCurrKey > bbMaxK ? bbCurrKey : bbMaxK ))
          done
          (( bbMaxK += 2 ))

          printf " \e[2m%s\e[0m %s\n" "Name:" "$bbIn"
          printf " \e[2m%s\e[0m " "Type:"
          printf "associative array %s\n" "[${#bbArrayRef[@]}]"

          # title
          printf "\e[2m%s. %*s %-*s %5s\e[0m\n" \
            " no" $bbMaxK "key " $bbMax "value" "len"

          # value
          local bbK
          for bbK in "${!bbArrayRef[@]}"; do
            printf "\e[2m%2d.\e[0m %*s: %-*s \e[2m%5s\e[0m\n" \
            "${bbNum}" $bbMaxK "[$bbK]" $bbMax \
            "${bbArrayRef[$bbK]}" "${#bbArrayRef[$bbK]}"
            (( ++bbNum ))
          done
          printf "\n"
        fi
     ;;&

    #                                                               SCALAR
    #=====================================================================
     # if 1. attribute is dash (-), var is scalar
     -[-linuxcrt]*)
        # if --brief, output single word type
        if ((bbBrief)); then
          printf "%s\n" "scalar"
          return 0
        else
          # otherwise output name, type and value
          local bbValue="${!bbIn}"
          printf " \e[2m%s\e[0m %s\n" "Name:" "$bbIn"

          if [[ $bbValue =~ : ]]; then
            printf " \e[2m%s\e[0m %s\n" "Type:"  "scalar (colon separated values)"
            printf "\e[2m%s\e[0m\n" "Value:"
            printf "       %s\n" ${bbValue//:/$'\n'}
          else
            printf " \e[2m%s\e[0m %s\n" "Type:" "scalar"
            printf "\e[2mValue:\e[0m %s \e[2m[%s]\e[0m\n" "$bbValue" "${#bbValue}"
          fi
        fi
     ;;&

    #                                                           ATTRIBUTES
    #=====================================================================
     *[linuxcrt]*) printf "$dim\n" " Attr:";;&
      *i*) printf '    %s\n' "-i (integer)"      ;;&
      *r*) printf '    %s\n' "-r (readonly)"     ;;&
      *x*) printf '    %s\n' "-x (export)"       ;;&
      *l*) printf '    %s\n' "-l (lowercasing)"  ;;&
      *c*) printf '    %s\n' "-c (capitalizing)" ;;&
      *u*) printf '    %s\n' "-u (uppercasing)"  ;;&
      *n*) printf '    %s\n' "-n (reference)"    ;;&
      *t*) printf '    %s\n' "-t (trace)"        ;;&
     *[linuxcrt]*) printf "\n";;

   esac
   echo
   return 0

#                                                                    SHELL
#=========================================================================
 else
    # if not var, check with 'type'
    if bbDeclare="$(type -t "$bbIn" 2>/dev/null)"; then
      # brief output
      if ((bbBrief)); then
        printf "%s\n" "$bbDeclare"
        return 0
      # verbose output
      else
        # oterwise, print more verbose, and styled, results
        printf "$bbDim" "Name:" "$bbIn"
        printf "$bbDim" "Type:" "$bbDeclare"

       #                                                          FUNCTION
       #==================================================================
        # In case it's a function, get the path used to source it -
        # that can be done by turning on bash's extended_debug mode.
        if [[ $bbDeclare == "function" ]]; then
          shopt -s extdebug
          local fPath="$(declare -F "$bbIn")"
          fPath=( $fPath )
          printf "$bbDim" "From:" "${fPath[2]} (line: ${fPath[1]})"
          shopt -u extdebug
          return 0
        fi

       #                                                              FILE
       #==================================================================
        # In case it's a file, get its path
        if [[ $bbDeclare == "file" ]]; then
          local fPath="$(which -a "$bbIn")"
          fPath=${fPath//$'\n'/:}
          printf "$bbDim" "Path:" "$fPath"
          # declare -Ag XTYPEOF=( [name]="$bbIn" [type]="$bbDeclare" [path]="$fPath" )
          return 0
        fi

      return 0
      fi

    fi

 fi
 # end: not var, not anything with type

# NAME is not anything, return status 2
return 2
} # end function



if [[ "$0" == "$BASH_SOURCE" ]]; then
  # if executed
  # echo "[typeof] executed!"
  typeof "$@"
else
  # if sourced
  # echo "[typeof] sourced!"

  # if called as sourcable like: `. typeof ARG`
  if (($# > 0)); then
    typeof "$@"
    unset -f typeof
  fi
fi

# bash completions: complete with variable names (complete -v)
complete -v typeof
