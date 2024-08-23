# Readline

bind: bind [-lpsvPSVX] [-m keymap] [-f filename] [-q name] [-u name] [-r keyseq] [-x keyseq:shell-command] [keyseq:readline-function or readline-command]

Set Readline key bindings and variables.
    
Bind a key sequence to a Readline function or a macro, or set a
Readline variable.  The non-option argument syntax is equivalent to
that found in ~/.inputrc, but must be passed as a single argument:
e.g., bind '"\C-x\C-r": re-read-init-file'.
    
Options

-m  keymap         Use KEYMAP as the keymap for the duration of this command.
                   Acceptable keymap names:
                     emacs              vi
                     emacs-standard     vi-move
                     emacs-meta         vi-command
                     emacs-ctlx         vi-insert
-l                 List names of functions.
-P                 List function names and bindings.
-p                 List functions and bindings in reusable form.
-S                 List key sequences that invoke macros and their values
-s                 List key sequences that invoke macros and their values in reusable form.
-V                 List variable names and values.
-v                 List variable names and values in reusable form.
-q  function-name  Query about which keys invoke the named function.
-u  function-name  Unbind all keys which are bound to the named function.
-r  keyseq         Remove the binding for KEYSEQ.
-f  filename       Read key bindings from FILENAME.
-x  keyseq:shell-command	Cause SHELL-COMMAND to be executed when KEYSEQ is entered.
-X                 List key sequences bound with -x and associated commands in reusable form.

Exit Status:
bind returns 0 unless an unrecognized option is given or an error occurs.

## List key sequences that invoke macros and their values

```bash
\C-xp outputs PATH=${PATH}\e\C-e\C-a\ef\C-f
\eH outputs \C-e --help\C-m
\eM outputs \C-aman \C-m
\eS outputs \C-a sudo \C-m
\eV outputs \C-e --version\C-m
\e[1;2A outputs \e\C-_ cd .. && ll\C-m
\e[1;2C outputs \e\C-_ popd && ll\C-m
\e[1;2D outputs \e\C-_ pushd . && cd .. && ll\C-m
```

## List key sequences that invoke macros and their values in reusable form

```bash
"\C-xp": "PATH=${PATH}\e\C-e\C-a\ef\C-f"
"\eH": "\C-e --help\C-m"
"\eM": "\C-aman \C-m"
"\eS": "\C-a sudo \C-m"
"\eV": "\C-e --version\C-m"
"\e[1;2A": "\e\C-_ cd .. && ll\C-m"
"\e[1;2C": "\e\C-_ popd && ll\C-m"
"\e[1;2D": "\e\C-_ pushd . && cd .. && ll\C-m"
```

## List variable names and values in reusable form

```bash
set bind-tty-special-chars on
set blink-matching-paren off
set byte-oriented off
set colored-completion-prefix on
set colored-stats on
set completion-ignore-case on
set completion-map-case on
set convert-meta off
set disable-completion off
set echo-control-characters on
set enable-bracketed-paste off
set enable-keypad off
set enable-meta-key on
set expand-tilde off
set history-preserve-point off
set horizontal-scroll-mode off
set input-meta on
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
set visible-stats on
set bell-style none
set comment-begin #
set completion-display-width -1
set completion-prefix-display-length 0
set completion-query-items 100
set editing-mode emacs
set emacs-mode-string @
set history-size 0
set keymap emacs
set keyseq-timeout 500
set vi-cmd-mode-string (cmd)
set vi-ins-mode-string (ins)
````

## List names of functions

```bash
abort
accept-line
alias-expand-line
arrow-key-prefix
backward-byte
backward-char
backward-delete-char
backward-kill-line
backward-kill-word
backward-word
beginning-of-history
beginning-of-line
bracketed-paste-begin
call-last-kbd-macro
capitalize-word
character-search
character-search-backward
clear-display
clear-screen
complete
complete-command
complete-filename
complete-hostname
complete-into-braces
complete-username
complete-variable
copy-backward-word
copy-forward-word
copy-region-as-kill
dabbrev-expand
delete-char
delete-char-or-list
delete-horizontal-space
digit-argument
display-shell-version
do-lowercase-version
downcase-word
dump-functions
dump-macros
dump-variables
dynamic-complete-history
edit-and-execute-command
emacs-editing-mode
end-kbd-macro
end-of-history
end-of-line
exchange-point-and-mark
forward-backward-delete-char
forward-byte
forward-char
forward-search-history
forward-word
glob-complete-word
glob-expand-word
glob-list-expansions
history-and-alias-expand-line
history-expand-line
history-search-backward
history-search-forward
history-substring-search-backward
history-substring-search-forward
insert-comment
insert-completions
insert-last-argument
kill-line
kill-region
kill-whole-line
kill-word
magic-space
menu-complete
menu-complete-backward
next-history
next-screen-line
non-incremental-forward-search-history
non-incremental-forward-search-history-again
non-incremental-reverse-search-history
non-incremental-reverse-search-history-again
old-menu-complete
operate-and-get-next
overwrite-mode
possible-command-completions
possible-completions
possible-filename-completions
possible-hostname-completions
possible-username-completions
possible-variable-completions
previous-history
previous-screen-line
print-last-kbd-macro
quoted-insert
re-read-init-file
redraw-current-line
reverse-search-history
revert-line
self-insert
set-mark
shell-backward-kill-word
shell-backward-word
shell-expand-line
shell-forward-word
shell-kill-word
shell-transpose-words
skip-csi-sequence
start-kbd-macro
tab-insert
tilde-expand
transpose-chars
transpose-words
tty-status
undo
universal-argument
unix-filename-rubout
unix-line-discard
unix-word-rubout
upcase-word
vi-append-eol
vi-append-mode
vi-arg-digit
vi-bWord
vi-back-to-indent
vi-backward-bigword
vi-backward-word
vi-bword
vi-change-case
vi-change-char
vi-change-to
vi-char-search
vi-column
vi-complete
vi-delete
vi-delete-to
vi-eWord
vi-editing-mode
vi-end-bigword
vi-end-word
vi-eof-maybe
vi-eword
vi-fWord
vi-fetch-history
vi-first-print
vi-forward-bigword
vi-forward-word
vi-fword
vi-goto-mark
vi-insert-beg
vi-insertion-mode
vi-match
vi-movement-mode
vi-next-word
vi-overstrike
vi-overstrike-delete
vi-prev-word
vi-put
vi-redo
vi-replace
vi-rubout
vi-search
vi-search-again
vi-set-mark
vi-subst
vi-tilde-expand
vi-unix-word-rubout
vi-yank-arg
vi-yank-pop
vi-yank-to
yank
yank-last-arg
yank-nth-arg
yank-pop
```

## List function names and bindings

```bash
abort can be found on "\C-g", "\C-x\C-g", "\e\C-g".
accept-line can be found on "\C-j", "\C-m".
alias-expand-line is not bound to any keys
arrow-key-prefix is not bound to any keys
backward-byte is not bound to any keys
backward-char can be found on "\C-b", "\eOD", "\e[D".
backward-delete-char can be found on "\C-h", "\C-?".
backward-kill-line can be found on "\C-x\C-?", "\e\C-_".
backward-kill-word can be found on "\e\C-h", "\C-_".
backward-word can be found on "\e[1;3D", "\e[1;5D", "\eb".
beginning-of-history can be found on "\e<".
beginning-of-line can be found on "\C-a", "\eOH", "\e[H".
bracketed-paste-begin can be found on "\e[200~".
call-last-kbd-macro can be found on "\C-xe".
capitalize-word can be found on "\ec".
character-search can be found on "\C-]".
character-search-backward can be found on "\e\C-]".
clear-display can be found on "\e\C-l".
clear-screen can be found on "\C-l".
complete can be found on "\e\e".
complete-command can be found on "\e!".
complete-filename can be found on "\e/".
complete-hostname can be found on "\e@".
complete-into-braces can be found on "\e{".
complete-username can be found on "\e~".
complete-variable can be found on "\e$".
copy-backward-word is not bound to any keys
copy-forward-word is not bound to any keys
copy-region-as-kill is not bound to any keys
dabbrev-expand is not bound to any keys
delete-char can be found on "\C-d", "\e[3~".
delete-char-or-list is not bound to any keys
delete-horizontal-space can be found on "\e\\".
digit-argument can be found on "\e-", "\e0", "\e1", "\e2", "\e3", ...
display-shell-version can be found on "\C-x\C-v".
do-lowercase-version can be found on "\C-xA", "\C-xB", "\C-xC", "\C-xD", "\C-xE", ...
downcase-word can be found on "\el".
dump-functions is not bound to any keys
dump-macros is not bound to any keys
dump-variables is not bound to any keys
dynamic-complete-history can be found on "\e\C-i".
edit-and-execute-command can be found on "\C-x\C-e".
emacs-editing-mode is not bound to any keys
end-kbd-macro can be found on "\C-x)".
end-of-history can be found on "\e>".
end-of-line can be found on "\C-e", "\eOF", "\e[F".
exchange-point-and-mark can be found on "\C-x\C-x".
forward-backward-delete-char is not bound to any keys
forward-byte is not bound to any keys
forward-char can be found on "\C-f", "\eOC", "\e[C".
forward-search-history can be found on "\C-s".
forward-word can be found on "\e[1;3C", "\e[1;5C", "\ef".
glob-complete-word can be found on "\eg".
glob-expand-word can be found on "\C-x*".
glob-list-expansions can be found on "\C-xg".
history-and-alias-expand-line is not bound to any keys
history-expand-line can be found on "\e^".
history-search-backward can be found on "\e[A".
history-search-forward can be found on "\e[B".
history-substring-search-backward is not bound to any keys
history-substring-search-forward is not bound to any keys
insert-comment can be found on "\e#".
insert-completions can be found on "\e*".
insert-last-argument can be found on "\e.", "\e_".
kill-line can be found on "\C-k".
kill-region is not bound to any keys
kill-whole-line is not bound to any keys
kill-word can be found on "\e[3;5~", "\ed".
magic-space is not bound to any keys
menu-complete can be found on "\C-i".
menu-complete-backward can be found on "\e[Z".
next-history can be found on "\C-n", "\eOB".
next-screen-line is not bound to any keys
non-incremental-forward-search-history can be found on "\en".
non-incremental-forward-search-history-again is not bound to any keys
non-incremental-reverse-search-history can be found on "\ep".
non-incremental-reverse-search-history-again is not bound to any keys
old-menu-complete is not bound to any keys
operate-and-get-next can be found on "\C-o".
overwrite-mode can be found on "\e[2~".
possible-command-completions can be found on "\C-x!".
possible-completions can be found on "\e=", "\e?".
possible-filename-completions can be found on "\C-x/".
possible-hostname-completions can be found on "\C-x@".
possible-username-completions can be found on "\C-x~".
possible-variable-completions can be found on "\C-x$".
previous-history can be found on "\C-p", "\eOA".
previous-screen-line is not bound to any keys
print-last-kbd-macro is not bound to any keys
quoted-insert can be found on "\C-q", "\C-v".
re-read-init-file can be found on "\C-x\C-r".
redraw-current-line is not bound to any keys
reverse-search-history can be found on "\C-r".
revert-line can be found on "\e\C-r", "\er".
self-insert can be found on " ", "!", "\"", "#", "$", ...
set-mark can be found on "\C-@", "\e ".
shell-backward-kill-word is not bound to any keys
shell-backward-word can be found on "\e\C-b".
shell-expand-line can be found on "\e\C-e".
shell-forward-word can be found on "\e\C-f".
shell-kill-word can be found on "\e\C-d".
shell-transpose-words can be found on "\e\C-t".
skip-csi-sequence is not bound to any keys
start-kbd-macro can be found on "\C-x(".
tab-insert is not bound to any keys
tilde-expand can be found on "\e&".
transpose-chars can be found on "\C-t".
transpose-words can be found on "\et".
tty-status is not bound to any keys
undo can be found on "\C-x\C-u", "\e\C-?".
universal-argument is not bound to any keys
unix-filename-rubout is not bound to any keys
unix-line-discard can be found on "\C-u".
unix-word-rubout can be found on "\C-w".
upcase-word can be found on "\eu".
vi-append-eol is not bound to any keys
vi-append-mode is not bound to any keys
vi-arg-digit is not bound to any keys
vi-bWord is not bound to any keys
vi-back-to-indent is not bound to any keys
vi-backward-bigword is not bound to any keys
vi-backward-word is not bound to any keys
vi-bword is not bound to any keys
vi-change-case is not bound to any keys
vi-change-char is not bound to any keys
vi-change-to is not bound to any keys
vi-char-search is not bound to any keys
vi-column is not bound to any keys
vi-complete is not bound to any keys
vi-delete is not bound to any keys
vi-delete-to is not bound to any keys
vi-eWord is not bound to any keys
vi-editing-mode is not bound to any keys
vi-end-bigword is not bound to any keys
vi-end-word is not bound to any keys
vi-eof-maybe is not bound to any keys
vi-eword is not bound to any keys
vi-fWord is not bound to any keys
vi-fetch-history is not bound to any keys
vi-first-print is not bound to any keys
vi-forward-bigword is not bound to any keys
vi-forward-word is not bound to any keys
vi-fword is not bound to any keys
vi-goto-mark is not bound to any keys
vi-insert-beg is not bound to any keys
vi-insertion-mode is not bound to any keys
vi-match is not bound to any keys
vi-movement-mode is not bound to any keys
vi-next-word is not bound to any keys
vi-overstrike is not bound to any keys
vi-overstrike-delete is not bound to any keys
vi-prev-word is not bound to any keys
vi-put is not bound to any keys
vi-redo is not bound to any keys
vi-replace is not bound to any keys
vi-rubout is not bound to any keys
vi-search is not bound to any keys
vi-search-again is not bound to any keys
vi-set-mark is not bound to any keys
vi-subst is not bound to any keys
vi-tilde-expand is not bound to any keys
vi-unix-word-rubout is not bound to any keys
vi-yank-arg is not bound to any keys
vi-yank-pop is not bound to any keys
vi-yank-to is not bound to any keys
yank can be found on "\C-y".
yank-last-arg can be found on "\e.", "\e_".
yank-nth-arg can be found on "\e\C-y".
yank-pop can be found on "\ey".
```

## List functions and bindings in reusable form

```
"\C-g": abort
"\C-x\C-g": abort
"\e\C-g": abort
"\C-j": accept-line
"\C-m": accept-line
# alias-expand-line (not bound)
# arrow-key-prefix (not bound)
# backward-byte (not bound)
"\C-b": backward-char
"\eOD": backward-char
"\e[D": backward-char
"\C-h": backward-delete-char
"\C-?": backward-delete-char
"\C-x\C-?": backward-kill-line
"\e\C-_": backward-kill-line
"\e\C-h": backward-kill-word
"\C-_": backward-kill-word
"\e[1;3D": backward-word
"\e[1;5D": backward-word
"\eb": backward-word
"\e<": beginning-of-history
"\C-a": beginning-of-line
"\eOH": beginning-of-line
"\e[H": beginning-of-line
"\e[200~": bracketed-paste-begin
"\C-xe": call-last-kbd-macro
"\ec": capitalize-word
"\C-]": character-search
"\e\C-]": character-search-backward
"\e\C-l": clear-display
"\C-l": clear-screen
"\e\e": complete
"\e!": complete-command
"\e/": complete-filename
"\e@": complete-hostname
"\e{": complete-into-braces
"\e~": complete-username
"\e$": complete-variable
# copy-backward-word (not bound)
# copy-forward-word (not bound)
# copy-region-as-kill (not bound)
# dabbrev-expand (not bound)
"\C-d": delete-char
"\e[3~": delete-char
# delete-char-or-list (not bound)
"\e\\": delete-horizontal-space
"\e-": digit-argument
"\e0": digit-argument
"\e1": digit-argument
"\e2": digit-argument
"\e3": digit-argument
"\e4": digit-argument
"\e5": digit-argument
"\e6": digit-argument
"\e7": digit-argument
"\e8": digit-argument
"\e9": digit-argument
"\C-x\C-v": display-shell-version
"\C-xA": do-lowercase-version
"\C-xB": do-lowercase-version
"\C-xC": do-lowercase-version
"\C-xD": do-lowercase-version
"\C-xE": do-lowercase-version
"\C-xF": do-lowercase-version
"\C-xG": do-lowercase-version
"\C-xH": do-lowercase-version
"\C-xI": do-lowercase-version
"\C-xJ": do-lowercase-version
"\C-xK": do-lowercase-version
"\C-xL": do-lowercase-version
"\C-xM": do-lowercase-version
"\C-xN": do-lowercase-version
"\C-xO": do-lowercase-version
"\C-xP": do-lowercase-version
"\C-xQ": do-lowercase-version
"\C-xR": do-lowercase-version
"\C-xS": do-lowercase-version
"\C-xT": do-lowercase-version
"\C-xU": do-lowercase-version
"\C-xV": do-lowercase-version
"\C-xW": do-lowercase-version
"\C-xX": do-lowercase-version
"\C-xY": do-lowercase-version
"\C-xZ": do-lowercase-version
"\eA": do-lowercase-version
"\eB": do-lowercase-version
"\eC": do-lowercase-version
"\eD": do-lowercase-version
"\eE": do-lowercase-version
"\eF": do-lowercase-version
"\eG": do-lowercase-version
"\eI": do-lowercase-version
"\eJ": do-lowercase-version
"\eK": do-lowercase-version
"\eL": do-lowercase-version
"\eN": do-lowercase-version
"\eP": do-lowercase-version
"\eQ": do-lowercase-version
"\eR": do-lowercase-version
"\eT": do-lowercase-version
"\eU": do-lowercase-version
"\eW": do-lowercase-version
"\eX": do-lowercase-version
"\eY": do-lowercase-version
"\eZ": do-lowercase-version
"\el": downcase-word
# dump-functions (not bound)
# dump-macros (not bound)
# dump-variables (not bound)
"\e\C-i": dynamic-complete-history
"\C-x\C-e": edit-and-execute-command
# emacs-editing-mode (not bound)
"\C-x)": end-kbd-macro
"\e>": end-of-history
"\C-e": end-of-line
"\eOF": end-of-line
"\e[F": end-of-line
"\C-x\C-x": exchange-point-and-mark
# forward-backward-delete-char (not bound)
# forward-byte (not bound)
"\C-f": forward-char
"\eOC": forward-char
"\e[C": forward-char
"\C-s": forward-search-history
"\e[1;3C": forward-word
"\e[1;5C": forward-word
"\ef": forward-word
"\eg": glob-complete-word
"\C-x*": glob-expand-word
"\C-xg": glob-list-expansions
# history-and-alias-expand-line (not bound)
"\e^": history-expand-line
"\e[A": history-search-backward
"\e[B": history-search-forward
# history-substring-search-backward (not bound)
# history-substring-search-forward (not bound)
"\e#": insert-comment
"\e*": insert-completions
"\e.": insert-last-argument
"\e_": insert-last-argument
"\C-k": kill-line
# kill-region (not bound)
# kill-whole-line (not bound)
"\e[3;5~": kill-word
"\ed": kill-word
# magic-space (not bound)
"\C-i": menu-complete
"\e[Z": menu-complete-backward
"\C-n": next-history
"\eOB": next-history
# next-screen-line (not bound)
"\en": non-incremental-forward-search-history
# non-incremental-forward-search-history-again (not bound)
"\ep": non-incremental-reverse-search-history
# non-incremental-reverse-search-history-again (not bound)
# old-menu-complete (not bound)
"\C-o": operate-and-get-next
"\e[2~": overwrite-mode
"\C-x!": possible-command-completions
"\e=": possible-completions
"\e?": possible-completions
"\C-x/": possible-filename-completions
"\C-x@": possible-hostname-completions
"\C-x~": possible-username-completions
"\C-x$": possible-variable-completions
"\C-p": previous-history
"\eOA": previous-history
# previous-screen-line (not bound)
# print-last-kbd-macro (not bound)
"\C-q": quoted-insert
"\C-v": quoted-insert
"\C-x\C-r": re-read-init-file
# redraw-current-line (not bound)
"\C-r": reverse-search-history
"\e\C-r": revert-line
"\er": revert-line
" ": self-insert
"!": self-insert
"\"": self-insert
"#": self-insert
"$": self-insert
"%": self-insert
"&": self-insert
"'": self-insert
"(": self-insert
")": self-insert
"*": self-insert
"+": self-insert
",": self-insert
"-": self-insert
".": self-insert
"/": self-insert
"0": self-insert
"1": self-insert
"2": self-insert
"3": self-insert
"4": self-insert
"5": self-insert
"6": self-insert
"7": self-insert
"8": self-insert
"9": self-insert
":": self-insert
";": self-insert
"<": self-insert
"=": self-insert
">": self-insert
"?": self-insert
"@": self-insert
"A": self-insert
"B": self-insert
"C": self-insert
"D": self-insert
"E": self-insert
"F": self-insert
"G": self-insert
"H": self-insert
"I": self-insert
"J": self-insert
"K": self-insert
"L": self-insert
"M": self-insert
"N": self-insert
"O": self-insert
"P": self-insert
"Q": self-insert
"R": self-insert
"S": self-insert
"T": self-insert
"U": self-insert
"V": self-insert
"W": self-insert
"X": self-insert
"Y": self-insert
"Z": self-insert
"[": self-insert
"\\": self-insert
"]": self-insert
"^": self-insert
"_": self-insert
"`": self-insert
"a": self-insert
"b": self-insert
"c": self-insert
"d": self-insert
"e": self-insert
"f": self-insert
"g": self-insert
"h": self-insert
"i": self-insert
"j": self-insert
"k": self-insert
"l": self-insert
"m": self-insert
"n": self-insert
"o": self-insert
"p": self-insert
"q": self-insert
"r": self-insert
"s": self-insert
"t": self-insert
"u": self-insert
"v": self-insert
"w": self-insert
"x": self-insert
"y": self-insert
"z": self-insert
"{": self-insert
"|": self-insert
"}": self-insert
"~": self-insert
"\200": self-insert
"\201": self-insert
"\202": self-insert
"\203": self-insert
"\204": self-insert
"\205": self-insert
"\206": self-insert
"\207": self-insert
"\210": self-insert
"\211": self-insert
"\212": self-insert
"\213": self-insert
"\214": self-insert
"\215": self-insert
"\216": self-insert
"\217": self-insert
"\220": self-insert
"\221": self-insert
"\222": self-insert
"\223": self-insert
"\224": self-insert
"\225": self-insert
"\226": self-insert
"\227": self-insert
"\230": self-insert
"\231": self-insert
"\232": self-insert
"\233": self-insert
"\234": self-insert
"\235": self-insert
"\236": self-insert
"\237": self-insert
" ": self-insert
"¡": self-insert
"¢": self-insert
"£": self-insert
"¤": self-insert
"¥": self-insert
"¦": self-insert
"§": self-insert
"¨": self-insert
"©": self-insert
"ª": self-insert
"«": self-insert
"¬": self-insert
"­": self-insert
"®": self-insert
"¯": self-insert
"°": self-insert
"±": self-insert
"²": self-insert
"³": self-insert
"´": self-insert
"µ": self-insert
"¶": self-insert
"·": self-insert
"¸": self-insert
"¹": self-insert
"º": self-insert
"»": self-insert
"¼": self-insert
"½": self-insert
"¾": self-insert
"¿": self-insert
"À": self-insert
"Á": self-insert
"Â": self-insert
"Ã": self-insert
"Ä": self-insert
"Å": self-insert
"Æ": self-insert
"Ç": self-insert
"È": self-insert
"É": self-insert
"Ê": self-insert
"Ë": self-insert
"Ì": self-insert
"Í": self-insert
"Î": self-insert
"Ï": self-insert
"Ð": self-insert
"Ñ": self-insert
"Ò": self-insert
"Ó": self-insert
"Ô": self-insert
"Õ": self-insert
"Ö": self-insert
"×": self-insert
"Ø": self-insert
"Ù": self-insert
"Ú": self-insert
"Û": self-insert
"Ü": self-insert
"Ý": self-insert
"Þ": self-insert
"ß": self-insert
"à": self-insert
"á": self-insert
"â": self-insert
"ã": self-insert
"ä": self-insert
"å": self-insert
"æ": self-insert
"ç": self-insert
"è": self-insert
"é": self-insert
"ê": self-insert
"ë": self-insert
"ì": self-insert
"í": self-insert
"î": self-insert
"ï": self-insert
"ð": self-insert
"ñ": self-insert
"ò": self-insert
"ó": self-insert
"ô": self-insert
"õ": self-insert
"ö": self-insert
"÷": self-insert
"ø": self-insert
"ù": self-insert
"ú": self-insert
"û": self-insert
"ü": self-insert
"ý": self-insert
"þ": self-insert
"ÿ": self-insert
"\C-@": set-mark
"\e ": set-mark
# shell-backward-kill-word (not bound)
"\e\C-b": shell-backward-word
"\e\C-e": shell-expand-line
"\e\C-f": shell-forward-word
"\e\C-d": shell-kill-word
"\e\C-t": shell-transpose-words
# skip-csi-sequence (not bound)
"\C-x(": start-kbd-macro
# tab-insert (not bound)
"\e&": tilde-expand
"\C-t": transpose-chars
"\et": transpose-words
# tty-status (not bound)
"\C-x\C-u": undo
"\e\C-?": undo
# universal-argument (not bound)
# unix-filename-rubout (not bound)
"\C-u": unix-line-discard
"\C-w": unix-word-rubout
"\eu": upcase-word
# vi-append-eol (not bound)
# vi-append-mode (not bound)
# vi-arg-digit (not bound)
# vi-bWord (not bound)
# vi-back-to-indent (not bound)
# vi-backward-bigword (not bound)
# vi-backward-word (not bound)
# vi-bword (not bound)
# vi-change-case (not bound)
# vi-change-char (not bound)
# vi-change-to (not bound)
# vi-char-search (not bound)
# vi-column (not bound)
# vi-complete (not bound)
# vi-delete (not bound)
# vi-delete-to (not bound)
# vi-eWord (not bound)
# vi-editing-mode (not bound)
# vi-end-bigword (not bound)
# vi-end-word (not bound)
# vi-eof-maybe (not bound)
# vi-eword (not bound)
# vi-fWord (not bound)
# vi-fetch-history (not bound)
# vi-first-print (not bound)
# vi-forward-bigword (not bound)
# vi-forward-word (not bound)
# vi-fword (not bound)
# vi-goto-mark (not bound)
# vi-insert-beg (not bound)
# vi-insertion-mode (not bound)
# vi-match (not bound)
# vi-movement-mode (not bound)
# vi-next-word (not bound)
# vi-overstrike (not bound)
# vi-overstrike-delete (not bound)
# vi-prev-word (not bound)
# vi-put (not bound)
# vi-redo (not bound)
# vi-replace (not bound)
# vi-rubout (not bound)
# vi-search (not bound)
# vi-search-again (not bound)
# vi-set-mark (not bound)
# vi-subst (not bound)
# vi-tilde-expand (not bound)
# vi-unix-word-rubout (not bound)
# vi-yank-arg (not bound)
# vi-yank-pop (not bound)
# vi-yank-to (not bound)
"\C-y": yank
"\e.": yank-last-arg
"\e_": yank-last-arg
"\e\C-y": yank-nth-arg
"\ey": yank-pop
```


