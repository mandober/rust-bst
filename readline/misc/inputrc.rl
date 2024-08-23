#!/bin/bash
# vim: set filetype=readline

# =============================================================================
# FILE: .inputrc
# DESC: user readline settings
# REPO: https://github.com/mandober/
# EDIT: 2020-02-10, 2017-09-30
# =============================================================================
# Only a few constructs are allowed in the inputrc:
#   - blank lines are ignored
#   - lines beginning with a hash (comments) are also ignored
#   - lines beginning with a dollar indicate conditional constructs
#   - other lines denote variable settings and key bindings
#   - it doesn't say that the trailing comments are allowed!
# 
# =============================================================================
# Readline:
#   * Variable Settings
#   * Functions
#   * KeySeq
#   * Macros
# 
# =============================================================================
# Readline Variable Settings
#   * Synopsis: set VAR VAL    
#          e.g. set editing-mode vi
#   * VARs and VALs are case-insensitive
#   * Unrecognized VARs are ignored
# 
# 
# Some keys have special names: SPC, TAB, DEL, ESC, LFD, RET
# If the keyboard lacks LFD (LineFeed) key, typing C-j produces it
# 
# =============================================================================

# region :: Readline Variable Settings
# =============================================================================
set bell-style none
set bind-tty-special-chars on

# enabling keypad fucks up things (history search keys)
set enable-keypad off

# 8-bit io
set meta-flag on
set input-meta on
set convert-meta off
set output-meta on

# completion
set match-hidden-files on
set expand-tilde off
set completion-query-items 100
set colored-completion-prefix on
set colored-stats on
set mark-directories on
set mark-symlinked-directories on
set visible-stats on

set menu-complete-display-prefix on
set show-all-if-ambiguous on
set show-all-if-unmodified on
set skip-completed-text on
set completion-ignore-case on
set completion-map-case on

# force pasting clipboard contents as a string, rather than possibly flushing
# the line and executing possibly embedded discomforting shit due to newlines
# https://unix.stackexchange.com/questions/356457/unexpected-behaviour-from-readlines-bind-command
# https://thejh.net/misc/website-terminal-copy-paste
# https://cirw.in/blog/bracketed-paste
set enable-bracketed-paste off

# endregion ===================================================================


$if Bash


#| edit PATH
$if term=xterm
"\C-xp": "PATH=${PATH}\e\C-e\C-a\ef\C-f"
$endif


# region Readline Functions
# =============================================================================
# Menu completion: TAB to cycle, Shift+TAB to cycle in opposite direction
TAB:       menu-complete
"\e[Z":    menu-complete-backward

# Search history pre-seeded with the text already typed
# UP: forward, DOWN: backward
"\e[A":    history-search-backward
"\e[B":    history-search-forward



$if term=xterm

#                                       Ctrl-RIGHT
"\e[1;5C": forward-word
#                                       Ctrl-LEFT
"\e[1;5D": backward-word
#                                       Ctrl-DEL
"\e[3;5~": kill-word
#                                       Ctrl-BS
"\C-_":    backward-kill-word
#                                       BS
"\e[3~":   delete-char
#                                       Ctrl-Alt-BS
"\e\C-_":  backward-kill-line
#                                       Alt-BS
"\e\d":    undo

$endif

# endregion ===================================================================



# region :: Readline Functions: Macros
# =============================================================================

# endregion ===================================================================




#                                                     MACRO: args from history
#=============================================================================
#"\eOP": "\e0\e."
# F1 inserts word0 (command) from previous history line(s)
#"\eOQ": "\e1\e."
# F2 inserts word1 (arg1) from previous history line(s)
#"\eOR": "\e2\e."
# F3 inserts word2
#"\eOS": "\e3\e."
# F4 inserts word3
#
# F2 will insert word1 (i.e. arg1, since word0 is command name) to current
# cursor position. Pressing F2 again will cycle through history, inserting
# arg1 (word1) from earlier commands (replacing previously inserted arg1).



#                                                            MACRO: cd hotkeys
#=============================================================================
#| KEY = 1 | Shift = +1 | Alt = +2 | Ctrl = +4 
#|
#|       UP = \e[A
#|     s-UP = \e[1;2A
#|     m-UP = \e[1;3A
#|   m-s-UP = \e[1;4A
#|     C-UP = \e[1;5A
#|   C-s-UP = \e[1;6A
#|   C-m-UP = \e[1;7A
#| C-m-s-UP = \e[1;8A


$if term=xterm

#| Shift+UP (Go UP) execute: "cd .. && ls"
"\e[1;2A":  "\e\C-_ cd .. && ll\C-M"

#| Shift+LEFT (Go BACK) execute: "pushd . && cd - && ls"
"\e[1;2D":  "\e\C-_ pushd . && cd .. && ll\C-M"

#| Shift+RIGHT: (Go PREV) exec: "popd && ll"
"\e[1;2C":  "\e\C-_ popd && ll\C-M"

$endif


#| S-UP   : cd ..
#"\e[1;2A":  "\e\C-_ cd .. && ll\C-M"

#| S-DOWN : cd
#"\e[1;2B":  "\e\C-_ cd\C-M"


#| S-LEFT : cd /
#"\e[1;2D":  "\e\C-_ cd /\C-M"


#| These two work fine:
#| m-LEFT does: pushd cwd then send "cd .."
#|
#| \e[1;3D is the code for Alt+LEFT  (m-LEFT)
#| \e[1;CD is the code for Alt+RIGHT (m-RIGHT)
#| \e is Alt or ESC
#| \C is Control
#| \C-KEY is Control+KEY (C-KEY)
#| \C-_ is Ctrl+_ (C-_)
#| Note the magic space before the actual command, e.g. " pushd"
#| Magic space prevents the line to be entered to history
#| \C-M is the same as pressing RET, i.e. it commits the current line.

#| m-LEFT  : pushd . && cd ..
#"\e[1;3D":  "\e\C-_ pushd . && cd .. && ll\C-M"

#| m-RIGHT : popd
#"\e[1;3C":  "\e\C-_ popd\C-M"

#                                                                     SEND KEYS
# =============================================================================
#| Shift+F5 : send "sudo service stop"
#"\e[15;2~": "sudo service stop\e[1;5D"
#"\e[15;2~": "sudo service  stop\e[1;5D\e[D"



#                                                       MACRO: sudo, man, help
#=============================================================================

$if term=xterm

#| m-s-s  Append "sudo "
"\eS": "\C-a sudo \C-m"

#| m-s-m  Append "man "
"\eM": "\C-aman \C-m"

#| m-s-h  Prepend " --help"
"\eH": "\C-e --help\C-m"

#| m-s-v  Prepend " --version"
"\eV": "\C-e --version\C-m"

$endif


#                                                  MACRO: switch editing modes
#=============================================================================
#$if mode=emacs
#"\e[24~": vi-editing-mode
#$endif

#$if mode=vi
#"\e[24~": emacs-editing-mode
#"C-d": delete-char
#$endif



#                                                                         MISC
#=============================================================================

"\C-xv": show-bash-version

#"\e[17~": "git add "
#"\e[18~": "git commit -m \"updated\""
#"\e[19~": "git push -u origin master"
#"\e[23~": "echo \"${var}\""


# bind
# -l   	List the names of all readline functions.

# -P   	Current readline function names and bindings.
# -p   	Same as above, formatted for re-using

# -S   	Display readline key sequences bound to macros and the strings they output.
# -s   	Same as above, formatted for re-using

# -V   	Current readline variable names and values.
# -v   	Same as above, formatted for re-using

# bind '"\C-x\C-r": re-read-init-file'
# bind '"\e[3~": delete-char'




$endif
