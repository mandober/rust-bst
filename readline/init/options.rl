# vim: filetype=readline

#| readline_vars.bash
#|
#| This file is meant to be sourced from ~/.inputrc

#| Readline variables

#| new options in Readline 8.2 (i.e. bash 5.2)
$if version >= 8.2
  set enable-active-region on
  set active-region-start-color '\e[01;33m'
  set active-region-end-color '\e[m'
$endif

set bell-style none
#set bind-tty-special-chars on
#set blink-matching-paren off
#set byte-oriented off
set colored-completion-prefix on
set colored-stats on
#set comment-begin #

#set completion-display-width -1
set completion-ignore-case on
set completion-map-case on
set completion-prefix-display-length 0
set completion-query-items 500
set convert-meta off
set disable-completion off
set echo-control-characters on
set editing-mode emacs
set emacs-mode-string @
set enable-bracketed-paste off
set enable-keypad off
set enable-meta-key on
set expand-tilde off
set history-preserve-point off
set history-size 0
set horizontal-scroll-mode off
set input-meta on
set keymap emacs
set keyseq-timeout 500
set mark-directories on
set mark-modified-lines off
set mark-symlinked-directories on
set match-hidden-files on
set menu-complete-display-prefix on
set meta-flag on
set output-meta on
set page-completions on
set prefer-visible-bell on
set print-completions-horizontally off
set revert-all-at-newline off
set show-all-if-ambiguous on
set show-all-if-unmodified on
set show-mode-in-prompt off
set skip-completed-text on
set vi-cmd-mode-string (cmd)
set vi-ins-mode-string (ins)
set visible-stats on

