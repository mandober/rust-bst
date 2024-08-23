# Readline variables

## List variable names and values in reusable form

```bash
set active-region-start-color '\e[01;33m'
set active-region-end-color '\e[m'
set enable-active-region on

set bell-style none
set bind-tty-special-chars on
set blink-matching-paren off
set byte-oriented off
set colored-completion-prefix on
set colored-stats on
set comment-begin #
set completion-display-width -1
set completion-ignore-case on
set completion-map-case on
set completion-prefix-display-length 0
set completion-query-items 100
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
````

## Readline variables desc

There are only a few basic constructs allowed in the Readline init file. 
Blank lines are ignored. Lines beginning with a `#` are comments. 
Lines beginning with a `$` indicate conditional constructs. 
Other lines denote variable settings and key bindings.

## Variable Settings

You can modify the run-time behavior of Readline by altering the values of 
variables in Readline using the `set` command within the init file. 

The syntax is simple:

    set variable value

Here, for example, is how to change from the default Emacs-like key binding 
to use vi line editing commands:

    set editing-mode vi

Variable names and values, where appropriate, are recognized without regard
to case. Unrecognized variable names are ignored.

Boolean variables (those that can be set to on or off) are set to on if the 
value is null or empty, on (case-insensitive), or 1. Any other value results 
in the variable being set to off.

`bind -V` lists the current Readline variable names and values.

A great deal of run-time behavior is changeable with the following variables.

## Variables

### active-region-start-color

A string variable that controls the fg and bg color when displaying
the text in active region (see `enable-active-region`).

This string must not take up any physical character positions on 
the display, so it should consist only of terminal escape sequences. 
It is output to the terminal before displaying the text in the active region.
This variable is reset to the default value whenever the terminal type changes.

The default value is the string that puts the terminal in *standout mode*,
as obtained from the terminal's *terminfo* description.

A sample value might be `\e[01;33m`.

### active-region-end-color

A string variable that "undoes" the effects of `active-region-start-color`
and restores "normal" terminal display appearance after displaying text
in the active region.

This string must not take up any physical character positions on the display,
so it should consist only of terminal escape sequences.

It is output to the terminal after displaying the text in the active region.

This variable is reset to the default value whenever the terminal type changes.

The default value is the string that restores the terminal from *standout mode*, 
as obtained from the terminal's terminfo description.

A sample value might be `\e[0m`.


### bell-style

Controls what happens when Readline wants to ring the terminal bell. 
If set to `none`, Readline never rings the bell. 
If set to `visible`, Readline uses a visible bell if one is available. 
If set to `audible` (the default), Readline attempts to ring the terminal's bell.

### bind-tty-special-chars

If 'on', Readline attempts to bind the control characters treated
specially by kernel terminal driver (see `stty`) to their Readline equivalents.
The default is `on`.

### blink-matching-paren

If 'on', Readline attempts to briefly move the cursor to an opening 
parenthesis when a closing parenthesis is inserted.
The default is `off`.

### byte-oriented

This option appears when listing Readline variables, but no desc.

### colored-completion-prefix

If 'on', when listing completions, Readline displays the common
prefix of the set of possible completions using a different color.

The color definitions are taken from `LS_COLORS` env var.

If there is a color definition in `LS_COLORS` for the custom suffix
`readline-colored-completion-prefix`, Readline uses this color for 
the common prefix instead of its default (see `dircolors`).

The default is `off`.

### colored-stats

If 'on', Readline displays possible completions
using different colors to indicate their file type.
The color definitions are taken from `LS_COLORS`.
The default is `off`.

### comment-begin

The string to insert at the beginning of line
when the insert-comment command is executed.
The default value is `#`.

### completion-display-width

The number of screen columns used to display 
possible matches when performing completion.

The value is ignored if it is less than 0 or 
greater than the terminal screen width (see `$COLUMNS`)

A value of 0 will cause matches to be displayed one per line.

The default value is `-1`.

### completion-ignore-case

If 'on', Readline performs filename matching
and completion in a case-insensitive fashion.
The default value is `off`.

### completion-map-case

If 'on', and `completion-ignore-case` is enabled, Readline treats 
dashes and underscores as equivalent when performing case-insensitive 
filename matching and completion.
The default value is `off`.

### completion-prefix-display-length

The length in characters of the common prefix of a list of
possible completions that is displayed without modification.

When set to a value greater than 0, common prefixes longer than this 
value are replaced with an ellipsis when displaying possible completions.

### completion-query-items

The number of possible completions that determines when the user is asked 
whether the list of possibilities should be displayed.

If the number of possible completions is greater than or equal to this value,
Readline will ask whether or not the user wishes to view them; 
otherwise, they are simply listed.

This variable must be set to an integer value greater than or equal to 0.

A 0 value means Readline should never ask; 
negative values are treated as 0.

The default limit is `100`.

### convert-meta

If on, Readline will convert 
*characters with the eighth bit set* into an *ASCII key sequence*
by stripping the eighth bit and prefixing an ESC char,
thereby converting them to a *meta-prefixed key sequence*.

The default value is `on`, but will be set to `off` 
if the locale is one that contains eight-bit chars (like UTF-8).

This variable is dependent on `LC_CTYPE` locale 
category, and may change if the locale is changed.

### disable-completion

If on, Readline will inhibit word completion.
Completion characters will be inserted into the
line as if they had been mapped to self-insert.
The default is `off`.

### echo-control-characters

When `on`, on OSs that indicate they support it, Readline echoes
*a char corresponding to a signal generated from the keyboard*.
The default is `on`.

### editing-mode

This variable controls which default set of key bindings is used.
By default, Readline starts up in Emacs editing mode, 
where the keystrokes are most similar to Emacs. 
This variable can be set to either `emacs` or `vi`.

### emacs-mode-string

If `show-mode-in-prompt` variable is enabled,
this string is displayed immediately before the last line 
of the primary prompt when emacs editing mode is active. 

The value is *expanded like a key binding*, so the standard set of 
meta- and control prefixes and backslash escape sequences is available.

Use `\1` and `\2` escapes to begin and end sequences of non-printing char,
which can be used to embed a terminal control sequence into *mode string*.

The default is `@`.

### enable-active-region

*point* is the current cursor position
*mark* refers to a saved cursor position
*region* is the text between the point and mark

When 'on', Readline allows certain commands to designate the region as active.

When the region is active, Readline highlights the text in the region using 
the value of the `active-region-start-color`, which defaults to the string 
that enables the terminal's standout mode.

The active region shows the text inserted by `bracketed-paste` and any 
matching text found by incremental and non-incremental history searches. 

The default is `on`.

### enable-bracketed-paste

When `on`, Readline configures the terminal to insert each paste into 
the editing buffer as a single string of characters, instead of treating 
each character as if it had been read from the keyboard. 
This is called putting the terminal into bracketed paste mode; 
it prevents Readline from executing any editing commands bound 
to key sequences appearing in the pasted text. The default is `on`.

### enable-keypad

When `on`, Readline will try to enable the application keypad when it is called.
Some systems need this to enable the arrow keys.
The default is `off`.

### enable-meta-key

When `on`, Readline will try to enable any meta modifier key the terminal 
claims to support when it is called. On many terminals, the meta key is 
used to send eight-bit characters. The default is `on`.

### expand-tilde

If `on`, tilde expansion is performed when Readline attempts word completion.
The default is `off`.

### history-preserve-point

If `on`, the history code attempts to place the point (the current cursor 
position) at the same location on each history line retrieved with 
`previous-history` or `next-history`.
The default is `off`.

### history-size

Set the maximum number of history entries saved in the history list.
If set to 0, any existing history entries are deleted and 
no new entries are saved. 
If set to a value less than zero, 
the number of history entries is not limited. 
By default, the number of history entries is not limited. 
If an attempt is made to set `history-size` to a non-numeric value, 
the maximum number of history entries will be set to `500`.

### horizontal-scroll-mode

This variable can be set to either 'on' or 'off'. 
Setting it to 'on' means that the text of the lines being edited will 
scroll horizontally on a single screen line when they are longer than 
the width of the screen, instead of wrapping onto a new screen line.
This variable is automatically set to `on` for terminals of height 1.
By default, this variable is set to `off`.

### input-meta

If `on`, Readline will enable eight-bit input (it will not clear the eighth 
bit in the characters it reads), regardless of what the terminal claims it 
can support. The default value is `off`, but Readline will set it to `on` if
the locale contains eight-bit characters. The name meta-flag is a synonym 
for this variable. This variable is dependent on `LC_CTYPE` locale category,
and may change if the locale is changed.

### isearch-terminators

The string of characters that should terminate an incremental search without 
subsequently executing the character as a command (see Searching for Commands 
in the History). If this variable has not been given a value, 
the characters ESC and C-J will terminate an incremental search.

### keymap

Sets Readline's idea of the current keymap for key binding commands.
Built-in keymap names are emacs, emacs-standard, emacs-meta, emacs-ctlx, 
vi, vi-move, vi-command, and vi-insert. 
vi is equivalent to vi-command (vi-move is also a synonym); 
emacs is equivalent to emacs-standard. 
Applications may add additional names. 
The default value is emacs. 
The value of the editing-mode variable also affects the default keymap.

### keyseq-timeout

Specifies the duration Readline will wait for a character when reading an 
ambiguous key sequence (one that can form a complete key sequence using the 
input read so far, or can take additional input to complete a longer 
key sequence). If no input is received within the timeout, Readline will use 
the shorter but complete key sequence. Readline uses this value to determine 
whether or not input is available on the current input source 
(`rl_instream` by default). The value is specified in milliseconds, so a value 
of 1000 means that Readline will wait one second for additional input. 
If this variable is set to a value less than or equal to 0, 
or to a non-numeric value, Readline will wait until another key is pressed 
to decide which key sequence to complete.
The default value is `500`.

### mark-directories

If `on`, completed directory names have a slash appended.
The default is `on`.

### mark-modified-lines

When `on`, causes Readline to display an asterisk at the start of history 
lines which have been modified. `off` by default.

### mark-symlinked-directories

If 'on', completed names which are symbolic links to directories have 
a slash appended (subject to the value of mark-directories). 
The default is 'off'.

### match-hidden-files

when 'on', causes Readline to match files whose names begin with 
a '.' (hidden files) when performing filename completion. 
If set to 'off', the leading '.' must be supplied by the user in 
the filename to be completed. 
This variable is 'on' by default.

### menu-complete-display-prefix

If 'on', menu completion displays the common prefix of the list of possible 
completions (which may be empty) before cycling through the list. 
The default is 'off'.

### output-meta

If 'on', Readline will display characters with the eighth bit set directly 
rather than as a meta-prefixed escape sequence. 
The default is 'off', but Readline will set it to 'on' if the locale contains 
eight-bit characters. This variable is dependent on the LC_CTYPE locale 
category, and may change if the locale is changed.

### page-completions

If 'on', Readline uses an internal more-like pager to display a screenful 
of possible completions at a time. 
This variable is 'on' by default.

### print-completions-horizontally

If 'on', Readline will display completions with matches sorted horizontally
in alphabetical order, rather than down the screen. The default is 'off'.

### revert-all-at-newline

If 'on', Readline will undo all changes to history lines before returning 
when accept-line is executed. By default, history lines may be modified and
retain individual undo lists across calls to readline().
The default is 'off'.

### show-all-if-ambiguous

This alters the default behavior of the completion functions. 
If set to 'on', words which have more than one possible completion cause 
the matches to be listed immediately instead of ringing the bell. 
The default value is 'off'.

### show-all-if-unmodified

This alters the default behavior of the completion functions in a fashion 
similar to show-all-if-ambiguous. If set to 'on', words which have more than 
one possible completion without any possible partial completion 
(the possible completions don't share a common prefix) 
cause the matches to be listed immediately instead of ringing the bell. 
The default value is 'off'.

### show-mode-in-prompt

If 'on', add a string to the beginning of the prompt indicating the editing 
mode: emacs, vi command, or vi insertion. The mode strings are user-settable 
(e.g. emacs-mode-string). 
The default value is 'off'.

### skip-completed-text

If 'on', this alters the default completion behavior when inserting a 
single match into the line. It's only active when performing completion 
in the middle of a word. If enabled, Readline does not insert characters 
from the completion that match characters after point in the word being 
completed, so portions of the word following the cursor are not duplicated.
For instance, if this is enabled, attempting completion when the cursor 
is after the 'e' in 'Makefile' will result in 'Makefile' rather 
than 'Makefilefile', assuming there is a single possible completion. 
The default value is 'off'.

### vi-cmd-mode-string

If the `show-mode-in-prompt` variable is enabled, this string is displayed 
immediately before the last line of the primary prompt when vi editing mode
is active and in command mode. The value is expanded like a key binding, 
so the standard set of meta- and control prefixes and backslash escape 
sequences is available. Use the '\1' and '\2' escapes to begin and end 
sequences of non-printing characters, which can be used to embed a terminal 
control sequence into the mode string. The default is '(cmd)'.

### vi-ins-mode-string

If `show-mode-in-prompt` variable is enabled, this string is displayed 
immediately before the last line of the primary prompt when vi editing mode 
is active and in insertion mode. The value is expanded like a key binding,
so the standard set of meta- and control prefixes and backslash escape 
sequences is available. Use the '\1' and '\2' escapes to begin and end 
sequences of non-printing characters, which can be used to embed a terminal 
control sequence into the mode string. The default is '(ins)'.

### visible-stats

If `on`, a character denoting a file's type is appended to the filename 
when listing possible completions. The default is `off`.


### Key Bindings

The syntax for controlling key bindings in the init file is simple. 
First you need to find the name of the command that you want to change. 
The following sections contain tables of the command name, 
the default keybinding, if any, and a description.

Once you know the name of the command, simply place on a line in 
the init file the name of the key you wish to bind the command to, 
a colon, and then the name of the command. 
There can be no space between the key name and the colon – that will 
be interpreted as part of the key name. 
The name of the key can be expressed in different ways, 
depending on what you find most comfortable.

In addition to command names, Readline allows keys to be bound to 
a string that is inserted when the key is pressed (a macro).

The `bind -p` command displays Readline function names and bindings 
in a format that can be put directly into an initialization file. 

    keyname: function-name or macro

keyname is the name of a key spelled out in English.
For example:

    Control-u: universal-argument
    Meta-Rubout: backward-kill-word
    Control-o: "> output"

In the example above, C-u is bound to the function universal-argument, 
M-DEL is bound to the function backward-kill-word, and 
C-o is bound to run the macro expressed on the right hand side 
(that is, to insert the text '> output' into the line).

A number of symbolic character names are recognized while processing this 
key binding syntax: 

    DEL, ESC, ESCAPE, LFD, NEWLINE, RET, 
    RETURN, RUBOUT, SPACE, SPC, TAB


    "keyseq": function-name or macro

keyseq differs from keyname above in that strings denoting an entire key 
sequence can be specified, by placing the key sequence in double quotes.
Some GNU Emacs style key escapes can be used, as in the following example,
but the special character names are not recognized.

    "\C-u": universal-argument
    "\C-x\C-r": re-read-init-file
    "\e[11~": "Function Key 1"

In the above example, C-u is again bound to the function universal-argument
(just as it was in the first example), 
'C-x C-r' is bound to the function re-read-init-file, and 
'ESC [ 1 1 ~' is bound to insert the text 'Function Key 1'.

The following GNU Emacs style escape sequences are available when specifying 
key sequences:

    \C-   control prefix
    \M-   meta prefix
    \e    escape character
    \\    backslash
    \""   double quotation mark
    \''   single quote or apostrophe

In addition to the GNU Emacs style escape sequences, a second set of 
backslash escapes is available:

    \a    alert (bell)
    \b    backspace
    \d    delete
    \f    form feed
    \n    newline
    \r    carriage return
    \t    tab
    \v    vtab
    \nnn  eight-bit char whose value is octal value nnn (1-3 digits)
    \xHH  eight-bit char whose value is hex value HH (1-2 hex digits)

When entering the text of a macro, single or double quotes must be used 
to indicate a macro definition. 
Unquoted text is assumed to be a function name. 
In the macro body, the backslash escapes described above are expanded. 
Backslash will quote any other character in the macro text, 
including '"' and '''. 

For example, the following binding will 
make 'C-x \' insert a single '\' into the line:

    "\C-x\\": "\\"

