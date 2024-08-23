#!/bin/bash
#|
#| Executable script to test definition queries.
#| 



echo "$needle"
declare -l needle="$1"
declare -l haystack="$HOME/proj/bash/shellements"
declare -l len=${#needle}
declare -l res=${haystack}/${needle}.md

echo "  [DEBUG] definition file: $res"

(( len == 0 )) && echo "[DEBUG] Query empty"

# if arg empty or undefined, set to to "help" for now
needle="${1:-help}"


# find needle in the haystack
# cat $haystack and $needle to form a file path
# if it exists yey, else ney
echo "  [DEBUG] Looking for the definition file ${res}"
echo "  [DEBUG] for the definiendum ${needle}"

[[ -r $res ]] && echo "  [DEBUG] Definiens found"

# cat "$res"

declare -la lajne

read -a lajne -d $'\n\n' -t 3 < "$res"

printf "Definiendum: %s\n" "${lajne[0]}"
printf "Definiens: %s\n" "${lajne[@]}"


# unset aux

echo -n ""
