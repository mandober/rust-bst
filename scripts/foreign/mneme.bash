#! /bin/bash
#┏┳┓┏┓╻┏━╸┏┳┓┏━╸
#┃┃┃┃┗┫┣╸ ┃┃┃┣╸
#╹ ╹╹ ╹┗━╸╹ ╹┗━╸
#Memory game in Bash, written by Christos Angelopoulos, March 2024, under GPLv2
#
# https://gitlab.com/christosangel/mneme/-/blob/main/mneme.sh?ref_type=heads
#

function load_characters()
{
 CHARACTERS=()
z=0
while [[ $z -lt $CHARACTERS_NUM ]]
do
 CHARACTERS[z]=${CHARACTER_SET[z]}
 ((z++))
done
}

function load_colors()
{
 C0="\e[38;5;242m" #Grid Color
 C1="\e[36m" # closed sq Cyan
 C2="\e[33m" #Yellow
 C3="\e[31m" #Red
 C4="\e[35m" # Magenta
 C5="\e[32m" # green
 C6="\e[34m" #blue
 C7="\e[37m"
 n="\e[m"
 I="\e[7m" #invert
 J="\e[5m" #blink
}

function load_config(){
 config_fail=0
 [[ -z "$CONFIG_FILE" ]]&&config_fail=1||source "$CONFIG_FILE"
 [[ -z $LEVEL ]]&&LEVEL="medium"&&config_fail=1
 [[ -z $CHARACTER_THEME ]]&&CHARACTER_THEME="animals"&&config_fail=1
 [[ -z $NOTIFICATION_TOGGLE ]]&&NOTIFICATION_TOGGLE="yes"&&config_fail=1
 [[ -z $PREFERRED_EDITOR ]]&&PREFERRED_EDITOR=nano &&config_fail=1
 [[ -z $CHEATSHEET_TOGGLE ]]&&CHEATSHEET_TOGGLE="yes"&&config_fail=1
 [[ -z $OPEN_BIND ]]&&OPEN_BIND="f"&&config_fail=1
 [[ -z $NAVIGATION_KEYS ]]&&NAVIGATION_KEYS="vim+arrows"&&config_fail=1
 [[ $config_fail == 1 ]]&&notify-send -t 9000 -i $SHARE_DIR/mneme.png "Configuration file was not loaded properly.
mneme.sh is running with default configuration.";
 case $LEVEL in
  easy)WIDTH=4;HEIGHT=4;COLORS=("\e[31m" "\e[33m" );CHARACTERS_NUM=4;
  ;;
  medium)WIDTH=6;HEIGHT=6;COLORS=("\e[31m" "\e[32m" "\e[33m" );CHARACTERS_NUM=6;
  ;;
  hard)WIDTH=8;HEIGHT=8;COLORS=("\e[31m" "\e[32m" "\e[33m" "\e[35m");CHARACTERS_NUM=8;
  ;;
  harder)WIDTH=10;HEIGHT=10;COLORS=("\e[31m" "\e[32m" "\e[33m" "\e[34m"  "\e[35m");CHARACTERS_NUM=10;
  ;;
  hardest)WIDTH=12;HEIGHT=12;COLORS=("\e[31m" "\e[32m" "\e[33m" "\e[34m"  "\e[35m"  "\e[36m");CHARACTERS_NUM=12;
 esac
 TOTAL=$((WIDTH * HEIGHT))
 case $CHARACTER_THEME in
  animals)CHARACTER_SET=('󰩃' '󰈄' '󰄛' '󰆚' '󰈺' '󰇥' '󰐁' '󰤇' '󰳆' '󰏩' '󱢴' '󱗆');arrow_str="  󰁍 󰁅 󰁝 󰁔  ";
  ;;
  numeric)CHARACTER_SET=('1' '2' '3' '4' '5' '6' '7' '8' '9' '0' '(' ')');arrow_str=" arrow keys"
  ;;
  letters)CHARACTER_SET=('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'H' 'I');arrow_str=" arrow keys"
  ;;
  objects)CHARACTER_SET=('󰀝' '󰋸' '󰟴' '󰌋' '󰐱' '󰐹' '󰩘' '󰩻' '󰐅' '󰔇' '󰶓' '󰉀');arrow_str="  󰁍 󰁅 󰁝 󰁔  "
  ;;
  symbols)CHARACTER_SET=('󰊠' '󰓎' '󰝨' '󰤄' '󰚌' '󰣐' '󰣑' '󰣎' '󰣏' '󰚑' '󰛤' '󰱱');arrow_str="  󰁍 󰁅 󰁝 󰁔  "
  ;;
  weather)CHARACTER_SET=('󰖨' '󰖔' '󰖐' '󰖘' '󰖗' '󰖑' '󰼸' '󰖝' '󰖒' '󰢘' '' '');arrow_str="  󰁍 󰁅 󰁝 󰁔  "
  ;;
  zodiac)CHARACTER_SET=('󰩽' '󰩾' '󰩿' '󰪀' '󰪁' '󰪂' '󰪃' '󰪄' '󰪅' '󰪆' '󰪇' '󰪆');arrow_str="  󰁍 󰁅 󰁝 󰁔  "
  ;;
  linux)CHARACTER_SET=('' '󰣭' '' '' '' '' '' '' '' '' '' '');arrow_str="  󰁍 󰁅 󰁝 󰁔  "
  ;;
 esac
 load_characters
 if [[ $NAVIGATION_KEYS == 'vim' ]];then NAV_LEFT='h';NAV_DOWN='j';NAV_UP='k';NAV_RIGHT='l';CHEAT_NAV='hjkl';fi
 if [[ $NAVIGATION_KEYS == 'aswd' ]];then NAV_LEFT='a';NAV_DOWN='s';NAV_UP='w';NAV_RIGHT='d';CHEAT_NAV='aswd';fi
}

function show_hiscores ()
{
 echo -e "${C0}       ╔═══╤═══╤═══╤═══╤═══╤═══╤═══╗ \n       ║ ${C1}T${C0} │ ${C1}O${C0} │ ${C1}P${C0} │   │ ${C1}T${C0} │ ${C1}E${C0} │ ${C1}N${C0} ║\n       ╚═══╧═══╧═══╧═══╧═══╧═══╧═══╝"
 if [[ -f "$SHARE_DIR"/hiscores.txt ]]&&[[ -n $(grep $LEVEL "$SHARE_DIR"/hiscores.txt) ]]
 then
  TOP_10_LENGTH=$(grep $LEVEL "$SHARE_DIR"/hiscores.txt|wc -l)
  if [[ $TOP_10_LENGTH -gt 10 ]];then TOP_10_LENGTH=10;fi
  ii=31;i=1;
  while [[ $i -le $TOP_10_LENGTH ]]
  do
   echo -e '\e['${ii}m $i $(grep $LEVEL "$SHARE_DIR"/hiscores.txt |sort -h|head -$i|tail +$i)
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
 draw_line "╔" "═" "╤" "╗" $WIDTH
 while [[ $height -le $HEIGHT ]]
 do
 width=1
  echo -ne "${C0}║"
  while [[ $width -le $WIDTH ]]
  do
   echo -ne "${F[x]}${n}${C0}"
   ((x++))
   [[ $width -lt $WIDTH ]]&&echo -ne "│"||echo -ne "║\n"
   ((width++))
  done
  [[ $height -lt $HEIGHT ]]&&draw_line "╟" "─" "┼" "╢" $WIDTH||draw_line "╚" "═" "╧" "╝" $WIDTH
  ((height++))
 done
 }

function load_cheat()
{
if [[ $CHEATSHEET_TOGGLE == yes ]];then echo -e "╭────────────────────────┬──────────────╮\n│ ${C4}$CHEAT_NAV$arrow_str   ${C2}Move${C0} │ ${C2}Solve      ${C4}q ${C0}│\n├────────────────────────┼──────────────┤\n│ ${C4}$OPEN_BIND,space           ${C2}Open${C0} │ ${C2}Hide Info  ${C4}i${C0} │\n├────────────────────────┴──────────────┤\n│ ${C3}${MESSAGE:0:38}${C0}│\n╰───────────────────────────────────────╯${n}";else echo -e "${C3}${MESSAGE:0:38}\n${C0}Enter ${C4}i${C0} to Show Info${n}";fi
}

function load_grid()
{
 i=0
 sq=$((RANDOM % $TOTAL))
 ii=0
 while [[ $i -lt $TOTAL ]]
 do
  F[i]="${C2}"░░░"" #sq appearence
  G[i]="0"  #sq content
  P[i]=$ii #sq position:== 0:left border, == $((WIDTH - 1)): right border, -lt $WIDTH:top border,  -ge $((TOTAL-WIDTH)) bottom border
  ((i++))
  ((ii++))
 if [[ $ii == $WIDTH ]];then ii=0;fi
 done
 for i in ${COLORS[@]}
 do
  for ii in ${CHARACTERS[@]}
  do
   for pair in {1..2}
   do
    while [[ ${G[sq]} != "0" ]]
    do
     sq=$((RANDOM % $TOTAL))
    done
    CHAR="$i"" ""$ii"" "
    G[sq]="$CHAR"
   done
  done
 done
}

function mv_cursor ()
{
 F[CURSOR]=${F[CURSOR]:5}
 F[NEW_CURSOR]="${I}${F[NEW_CURSOR]}"
 CURSOR="$NEW_CURSOR"
}

function new_game()
{
 MESSAGE="    Good luck!                        "
 load_grid
 TRIES=0
 FOUND=0
 PAIR=1
 CHECK=0
}

function win_game()
{
 clear
 print_matrix
 echo -e " ${J}${C3}WELL DONE!${n}\n ${C1}You solved the puzzle in $TRIES TRIES${n}"
 echo $TRIES Tries $(date +%Y-%m-%d\ %T) $LEVEL>>$SHARE_DIR/hiscores.txt
 echo -e "${C0}Press any key to return to the main menu${n}";read -sn 1 v;db="M";clear;
}

function cursor_reappear() {
 tput cnorm
exit
}

function check_open ()
{
 if [[ $CHECK == 1 ]]
 then
  ((TRIES++))
  if [[ "${G[POS1]}" == "${G[POS2]}" ]]
  then ((FOUND++))
   F[POS1]=${F[POS1]:5}
   F[POS2]=${F[POS2]:5}
  else
   F[POS1]="${C2}"░░░""
   F[POS2]=${I}"${C2}"░░░""
   read -sn 1 xxx
   clear
   print_matrix
   load_cheat
  fi
 fi
 MESSAGE="Tries: $TRIES   Found: $FOUND out of $((TOTAL / 2))                      "&&CHECK=0
}

function open_sq()
{
 if [[ ${F[CURSOR]} == *"░"* ]]
 then
  F[CURSOR]=${I}${I}${G[CURSOR]}
  if [[ $PAIR == 1 ]]
  then
   POS1=$CURSOR
   PAIR=2
  else
   POS2=$CURSOR
   PAIR=1
   CHECK=1
  fi
 fi
}

function check_win ()
{
if [[ $FOUND -eq $((TOTAL / 2)) ]]; then win_game;db="M";fi
}

function play_menu ()
{
 db="";
 CURSOR="0"
 F[0]="${I}"${F[0]}
 while [[ "$db" != "M" ]]
 do
  clear
  print_matrix
  load_cheat
  check_open
  check_win
  [[ "$db" != "M" ]]&&read -sn 1 db
  [[ $(echo "$db" | od) = "$spacebar" ]]&&db=$OPEN_BIND
  case $db in
   $NAV_UP|A) if  [[ $CURSOR -ge $WIDTH ]]; then NEW_CURSOR=$((CURSOR-WIDTH));mv_cursor;fi;
   ;;
   $NAV_DOWN|B) if  [[ $CURSOR -lt $((TOTAL-WIDTH)) ]]; then NEW_CURSOR=$((CURSOR+$WIDTH));mv_cursor;fi;
   ;;
   $NAV_RIGHT|C) if  [[ ${P[CURSOR]} !=  $((WIDTH-1)) ]]; then NEW_CURSOR=$((CURSOR+1));mv_cursor;fi;
   ;;
   $NAV_LEFT|D) if  [[ ${P[CURSOR]} != 0 ]]; then NEW_CURSOR=$((CURSOR-1));mv_cursor;fi;
   ;;
   q|Q)clear;i=0;while [[ $i -lt $TOTAL ]];do F[i]="${G[i]}";((i++));done;CHEATSHEET_TOGGLE="no";print_matrix;echo -e "\e[3m${C2}Intelligence is the wife,\nimagination is the mistress,\nmemory is the servant. \n                   Victor Hugo${C0}";[[ $NOTIFICATION_TOGGLE == "yes" ]]&&notify-send -t 5000 -i  "$SHARE_DIR/mneme.png" "Quitting mneme game...";echo -e "${C0}Press any key to return to the main menu${n}";read -sn 1 v;db="M";clear;
   ;;
   I|i) if [[ $CHEATSHEET_TOGGLE == yes ]];then CHEATSHEET_TOGGLE="no";else CHEATSHEET_TOGGLE="yes";fi;
   ;;
   $OPEN_BIND)open_sq;
   ;;
   *)
  esac
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
  echo -e "${C0}╔═══╤═══╤═══╤═══╤═══╗"
  echo -e "${C0}║ ${C2}M ${C0}│${C2} N ${C0}│${C2} E ${C0}│${C3} M ${C0}${C0}│${C3} E ${C0}║"
  echo -e "${C0}╚═══╧═══╧═══╧═══╧═══╝"
  echo -e "${C0}╔═══╤═══╤═══╤═══╗╭────────────────────╮"
  echo -e "${C0}║${C2} ${CHARACTERS[1]} ${C0}│${C3} ${CHARACTERS[0]} ${C0}│${C3} ${CHARACTERS[2]} ${C0}│${C2} ${CHARACTERS[3]} ${C0}║│${C4} n        ${n}${C2} New Game ${C0}│"
  echo -e "${C0}╟───┼───┼───┼───╢├────────────────────┤"
  echo -e "${C0}║${C2} ${CHARACTERS[2]} ${C0}│${C3} ${CHARACTERS[2]} ${C0}│${C3} ${CHARACTERS[3]} ${C0}│${C2} ${CHARACTERS[2]} ${C0}║│${C4} e    ${n}${C2}  Preferences ${C0}│"
  echo -e "${C0}╟───┼───┼───┼───╢├────────────────────┤"
  echo -e "${C0}║${C2} ${CHARACTERS[3]} ${C0}│${C2} ${CHARACTERS[1]} ${C0}│${C3} ${CHARACTERS[1]} ${C0}│${C3} ${CHARACTERS[0]} ${C0}║│${C4} s      ${n}${C2}Show Top 10 ${C0}│"
  echo -e "${C0}╟───┼───┼───┼───╢├────────────────────┤"
  echo -e "${C0}║${C3} ${CHARACTERS[1]} ${C0}│${C3} ${CHARACTERS[3]} ${C0}│${C2} ${CHARACTERS[0]} ${C0}│${C2} ${CHARACTERS[0]} ${C0}║│${C4} q          ${n}${C2}   Exit ${C0}│"
  echo -e "${C0}╚═══╧═══╧═══╧═══╝╰────────────────────╯${n}"
  read -sn 1 mm
  case $mm in
   n)clear;new_game;play_menu;
   ;;
   e) clear;[[ $NOTIFICATION_TOGGLE == "yes" ]]&&notify-send -t 5000 -i "$SHARE_DIR/mneme.png" "Editing mneme configuration file" &eval $PREFERRED_EDITOR $CONFIG_FILE;tput civis;load_config;
   ;;
   s)clear;show_hiscores;echo -e "\n ${C0}Press any key to return${n}";read -sN 1 v;clear;
   ;;
   q)clear;[[ $NOTIFICATION_TOGGLE == "yes" ]]&&notify-send -t 5000 -i  "$SHARE_DIR/mneme.png" "Exited mneme.";
   ;;
   *)clear;
  esac
 done
}
###########################
trap cursor_reappear HUP INT QUIT TERM EXIT ABRT
tput civis # make cursor invisible
spacebar=$(cat << eof
0000000 000012
0000001
eof
)
CONFIG_FILE="$HOME/.config/mneme/mneme.config"
SHARE_DIR="$HOME/.local/share/mneme"
############## GAME ####################
load_config
load_colors
new_game
main_menu
