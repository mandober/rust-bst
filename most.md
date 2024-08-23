# most

## Keys

- Q               quit most
- :N,:n           quit this file and view next (use up/down to select next file)

Movement
- DOWN, RETURN    move down one line ¹
- UP              move up one line ¹
- T               goto top of file
- B               goto bottom of file
- G, J            goto line
- %               goto percent

Scroll
- D, SPACE        scroll down one screen ¹
- U, DELETE       scroll up one screen ¹
- <               scroll window left
- >, TAB          scroll window right
- RIGHT           scroll window left by 1 column
- LEFT            scroll window right by 1 column

Window Commands
- Ctrl-X 2, Ctrl-W 2     split window
- Ctrl-X 1, Ctrl-W 1     make only one window
- Ctrl-X O, O            move to other window
- Ctrl-X 0               delete window

Searching
- /, S, f                search forward ¹
- ?                      search backward ¹
- N                      find next in current search direction ¹

Miscellaneous
- Ctrl-X Ctrl-F          read a file from disk
- E                      edit file in `MOST_EDITOR` or `EDITOR`
- F                      simulate `tail -f` mode
- R, Ctrl-R              redraw screen
- W                      toggle width between 80 and 132 char mode
- :o                     toggle options:  `b`inary, `w`rap, `t`ab


¹ This command may be repeated 'n' times by entering a number 
  then the command key, e.g. '5 SPACE' moves 5 screens forward.


