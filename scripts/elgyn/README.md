# elgyn

Bash script for terminal tooltips.

https://en.wikipedia.org/wiki/ANSI_escape_code
https://conemu.github.io/en/AnsiEscapeCodes.html
https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html


CSI is followed by
- any number (including none) of parameter bytes in range 0x30 - 0x3F
  __ASCII 0–9:;<=>?__
- any number of intermediate bytes in range 0x20 - 0x2F
  __ASCII space and !"#$%&'()*+,-./__
- a single final byte in range 0x40 - 0x7E
  __ASCII @A–Z[\]^_`a–z{|}~__

Sequences containing the parameter bytes `<=>?` or the final bytes 0x70 - 0x7E (p–z{|}~) are private.

## Moves the cursor

Moves the cursor `n` (default 1) cells in the given direction. If the cursor is already at the edge of the screen, this has no effect.
- CSI n A   CUU   Cursor Up
- CSI n B   CUD   Cursor Down
- CSI n C   CUF   Cursor Forward
- CSI n D   CUB   Cursor Back

- CSI n E   CNL   Cursor Next Line
  Moves cursor to beginning of the line n (default 1) lines down
- CSI n F   CPL   Cursor Previous Line
  Moves cursor to beginning of the line n (default 1) lines up
- CSI n G   CHA   Cursor Horizontal Absolute
  Moves the cursor to column n (default 1). 

- CSI n ; m H  CUP  Cursor Position
  Moves the cursor to row n, column m. The values are 1-based, and default to 1 (top left corner) if omitted. A sequence such as CSI ;5H is a synonym for CSI 1;5H as well as CSI 17;H is the same as CSI 17H and CSI 17;1H

- CSI s
  SCP, SCOSC
  Save Current Cursor Position  
  Saves the cursor position/state in SCO console mode. In vertical split screen mode, instead used to set (as CSI n ; n s) or reset left and right margins.

- CSI u
  RCP, SCORC
  Restore Saved Cursor Position
  Restores the cursor position/state in SCO console mode.

Alternative screen buffer (from xterm)
- CSI ? 1049 h   Enable
- CSI ? 1049 l   Disable
