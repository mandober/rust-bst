#! /bin/bash
#┏┓╻╻┏┓╻┏━╸
#┃┗┫┃┃┗┫┣╸
#╹ ╹╹╹ ╹┗━╸
#3x3 slide puzzle in Bash, written by Christos Angelopoulos, April 2024, under GPL v2

#
# https://gitlab.com/christosangel/nine
#

function load_characters()
{
 CHARACTERS=()
z=0
while [[ $z -lt 9 ]]
do
 CHARACTERS[z]=${CHARACTER_SET[z]}
 ((z++))
done
}

function load_colors()
{
 C0="\e[38;5;242m" #Grid Color
 C1="\e[36m" # Cyan
 C2="\e[33m" #Yellow
 C3="\e[31m" #Red
 C4="\e[35m" # Magenta
 C5="\e[32m" # Green
 C6="\e[34m" #Blue
 n="\e[m"
 I="\e[7m" #invert
 J="\e[5m" #blink
}

function load_config(){
 load_colors
 config_fail=0
 [[ -z "$CONFIG_FILE" ]]&&config_fail=1||source "$CONFIG_FILE"
 [[ -z $CHARACTER_THEME ]]&&CHARACTER_THEME="numbers"&&config_fail=1
 [[ -z $CURSOR_COLOR ]]&&CURSOR_COLOR="red"&&config_fail=1
 [[ -z $NOTIFICATION_TOGGLE ]]&&NOTIFICATION_TOGGLE="yes"&&config_fail=1
 [[ -z $PREFERRED_EDITOR ]]&&PREFERRED_EDITOR=${EDITOR-nano} &&config_fail=1
 [[ -z $CHEATSHEET_TOGGLE ]]&&CHEATSHEET_TOGGLE="yes"&&config_fail=1
 [[ -z $NAVIGATION_KEYS ]]&&NAVIGATION_KEYS="vim"&&config_fail=1
 [[ $config_fail == 1 ]]&&notify-send -t 9000 -i $SHARE_DIR/nine.png "Configuration file was not loaded properly.
nine.sh is running with default configuration.";
 case $CHARACTER_THEME in
  numbers)CHARACTER_SET=('1' '2' '3' '4' '5' '6' '7' '8' '+');
  ;;
  letters)CHARACTER_SET=('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' '+');
  ;;
 esac
 case $CURSOR_COLOR in
  gray)C_COLOR=${C0};
  ;;
  cyan)C_COLOR=${C1};
  ;;
  yellow)C_COLOR=${C2};
  ;;
  red)C_COLOR=${C3};
  ;;
  magenta)C_COLOR=${C4};
  ;;
  green)C_COLOR=${C5};
  ;;
  blue)C_COLOR=${C6};
  ;;
 esac
 load_characters
 if [[ $NAVIGATION_KEYS == 'vim' ]];then NAV_LEFT='h';NAV_DOWN='j';NAV_UP='k';NAV_RIGHT='l';CHEAT_NAV='hjkl';fi
 if [[ $NAVIGATION_KEYS == 'aswd' ]];then NAV_LEFT='a';NAV_DOWN='s';NAV_UP='w';NAV_RIGHT='d';CHEAT_NAV='aswd';fi
}

function show_hiscores ()
{
 echo -e "${C0} ╔═══╤═══╤═══╤═══╤═══╤═══╤═══╗ \n ║ ${C1}T${C0} │ ${C1}O${C0} │ ${C1}P${C0} │   │ ${C1}T${C0} │ ${C1}E${C0} │ ${C1}N${C0} ║\n ╚═══╧═══╧═══╧═══╧═══╧═══╧═══╝"
 if [[ -f "$SHARE_DIR"/hiscores.txt ]]&&[[ -n $(cat "$SHARE_DIR"/hiscores.txt) ]]
 then
  TOP_10_LENGTH=$(cat "$SHARE_DIR"/hiscores.txt|wc -l)
  if [[ $TOP_10_LENGTH -gt 10 ]];then TOP_10_LENGTH=10;fi
  ii=31;i=1;
  while [[ $i -le $TOP_10_LENGTH ]]
  do
   echo -e '\e['${ii}m $i $(cat "$SHARE_DIR"/hiscores.txt |sort -h|head -$i|tail +$i)
   sleep 0.3
   ((i++));((ii++))
   if [[ $ii -gt 36 ]];then ii=31;fi;
  done
 else echo -e " No statistics available just yet."
 fi
 tput civis; #make cursor disappear
}

function draw_line (){
d=1
echo -ne "${C0}""$1"
while [[ $d -le $5 ]]
do
echo -ne "$2$2$2"
[[ $d -lt $5 ]]&&echo -ne "$3"||echo -ne "$4\n"
((d++))
done
}

function print_matrix()
{
 x=0
 height=1
 draw_line "╔" "═" "╤" "╗" 3
 while [[ $height -le 3 ]]
 do
 width=1
  echo -ne "${C0}║"
  while [[ $width -le 3 ]]
  do
   [[ ${G[x]} == *"+"* ]]&&echo -ne "${C_COLOR}${G[x]}${n}${C0}"||echo -ne "${C2}${G[x]}${n}${C0}"
   ((x++))
   [[ $width -lt 3 ]]&&echo -ne "│"||echo -ne "║\n"
   ((width++))
  done
  [[ $height -lt 3 ]]&&draw_line "╟" "─" "┼" "╢" 3||draw_line "╚" "═" "╧" "╝" 3
  ((height++))
 done
 }

function load_cheat()
{
if [[ $CHEATSHEET_TOGGLE == yes ]];then echo -e "╭───────────────────┬───────────────────╮\n│ ${C4}$CHEAT_NAV,arrows ${C1} Move ${C0}│ ${C1}Hide Info       ${C4}i ${C0}│\n├───────────────────┼───────────────────┤\n│ ${C4}q            ${C1}Quit${C0} │ ${C3}${MESSAGE:0:18}${C0}│\n╰───────────────────┴───────────────────╯\n${n}";else echo -e "${C3}${MESSAGE:0:17}\n${C4}i${C0}:Show Info${n}";fi
}

function load_grid()
{
 i=0
 sq=$((RANDOM % 9))
 ii=0
 while [[ $i -lt 9 ]]
 do
  G[i]="0"  #sq content
  P[i]=$ii #sq position:== 0:left border, == $((WIDTH - 1)): right border, -lt $WIDTH:top border,  -ge $((TOTAL-WIDTH)) bottom border
  ((i++))
  ((ii++))
 if [[ $ii == 3 ]];then ii=0;fi
 done
 for i in ${CHARACTERS[@]}
 do
  while [[ ${G[sq]} != "0" ]]
  do
   sq=$((RANDOM % 9))
  done
  CHAR=" ""$i"" "
  G[sq]="$CHAR"
 done
 CURSOR=$sq
}


function new_game()
{
 MESSAGE="Good luck!                        "
 load_grid
 TRIES=0
}

function win_game()
{
 clear
 print_matrix
 echo -e " ${J}${C3}WELL DONE!${n}\n ${C1}You solved the puzzle in $TRIES TRIES${n}"
 echo $TRIES Tries $(date +%Y-%m-%d\ %T) >>$SHARE_DIR/hiscores.txt
 echo -e "${C0}Press any key to return to the main menu${n}";read -sn 1 v;db="M";clear;
}

function cursor_reappear() {
 tput cnorm
exit
}

function mv_cursor ()
{
 G[CURSOR]=${G[NEW_CURSOR]}
  G[NEW_CURSOR]=${I}" + "
  CURSOR="$NEW_CURSOR"
((TRIES++));
 MESSAGE="MOVES: $TRIES                               "
}

function check_win ()
{
CC=${CHARACTERS[@]// /}
GG=${G[@]/\\e[7m/}
if [[ ${GG[@]// /} == ${CC[@]// /} ]]; then win_game;db="M";fi
}

function play_menu ()
{
 db="";
 G[CURSOR]="${I}"${G[CURSOR]}
 while [[ "$db" != "M" ]]
 do
  clear
  print_matrix
  load_cheat
  [[ "$db" != "M" ]]&&read -sn 1 db
  [[ $(echo "$db" | od) = "$spacebar" ]]&&db=$SLIDE_BIND
  case $db in
   $NAV_UP|A) if  [[ $CURSOR -ge 3 ]]; then NEW_CURSOR=$((CURSOR-3));mv_cursor;fi;
   ;;
   $NAV_DOWN|B) if  [[ $CURSOR -lt $((9-3)) ]]; then NEW_CURSOR=$((CURSOR+3));mv_cursor;fi;
   ;;
   $NAV_RIGHT|C) if  [[ ${P[CURSOR]} !=  $((3-1)) ]]; then NEW_CURSOR=$((CURSOR+1));mv_cursor;fi;
   ;;
   $NAV_LEFT|D) if  [[ ${P[CURSOR]} != 0 ]]; then NEW_CURSOR=$((CURSOR-1));mv_cursor;fi;
   ;;
   q|Q)clear;db="M";clear;
   ;;
   I|i) if [[ $CHEATSHEET_TOGGLE == yes ]];then CHEATSHEET_TOGGLE="no";else CHEATSHEET_TOGGLE="yes";fi;
   ;;
   *)
  esac
  check_win
 done
}

function cursor_reappear() {
tput cnorm
exit
}

function main_menu ()
{
clear
 mm=""
 while [[ "$mm" != "q" ]]
 do
  echo -e "${C0}╔═══╤═══╤═══╤═══╗"
  echo -e "${C0}║ ${C5}N ${C0}│${C5} I ${C0}│${C5} N ${C0}│${C_COLOR}${I} E ${n}${C0}║"
  echo -e "${C0}╚═══╧═══╧═══╧═══╝"
  echo -e "${C0}╔═══╤═══╤═══╗╭─────────────────╮"
  echo -e "${C0}║${C2} ${CHARACTERS[0]} ${C0}│${C2} ${CHARACTERS[1]} ${C0}│${C2} ${CHARACTERS[2]} ${C0}║│${C4} n     ${n}${C1} New Game ${C0}│"
  echo -e "${C0}╟───┼───┼───╢├─────────────────┤"
  echo -e "${C0}║${C2} ${CHARACTERS[3]} ${C0}│${C2} ${CHARACTERS[4]} ${C0}│${C2} ${CHARACTERS[5]} ${C0}║│${C4} e   ${n}${C1}Preferences ${C0}│"
  echo -e "${C0}╟───┼───┼───╢├─────────────────┤"
  echo -e "${C0}║${C2} ${CHARACTERS[6]} ${C0}│${C2} ${CHARACTERS[7]} ${C0}│${C_COLOR}${I} ${CHARACTERS[8]} ${n}${C0}║│${C4} s   ${n}${C1}Show Top 10 ${C0}│"
  echo -e "${C0}╚═══╧═══╧═══╝├─────────────────┤"
  echo -e "${C0}             │${C4} q       ${n}${C1}   Exit ${C0}│"
  echo -e "${C0}             ╰─────────────────╯${n}"
  read -sn 1 mm
  case $mm in
   n)clear;new_game;play_menu;
   ;;
   e) clear;[[ $NOTIFICATION_TOGGLE == "yes" ]]&&notify-send -t 5000 -i "$SHARE_DIR/nine.png" "Editing nine configuration file" &eval $PREFERRED_EDITOR $CONFIG_FILE;tput civis;load_config;
   ;;
   s)clear;show_hiscores;echo -e "\n ${C0}Press any key to return${n}";read -sN 1 v;clear;
   ;;
   q)clear;[[ $NOTIFICATION_TOGGLE == "yes" ]]&&notify-send -t 5000 -i  "$SHARE_DIR/nine.png" "Exited nine.";
   ;;
   *)clear;
  esac
 done
}
############## GAME ####################
trap cursor_reappear HUP INT QUIT TERM EXIT ABRT
tput civis # make cursor invisible
CONFIG_FILE="$HOME/.config/nine/nine.config"
SHARE_DIR="$HOME/.local/share/nine"
load_config
main_menu
