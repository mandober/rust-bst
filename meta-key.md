# Meta bit, meta key, characters with 8th bit set

## Meta key

*Meta key* is a modifier key, usually labelled as *Alt*.
There are usually two Alt keys: *Left Alt* (LAlt) and 
*Right Alt* (RAlt), although the latter is often called *AltGr*
and it may not always emit the same key sequence as LAlt.
In key combos, the Alt key is denoted by `m` (meta),
e.g. `m-a` means Alt+a, while `m-A` may also be denoted as `m-s-a`.

As a modifier key, Alt contributes +2 to the emitted code of a key;
e.g. `[6~` is bare <PageDown> key press, but `[6;3~` is <M-PageDown>.

This example also shows that <ESC> can act as <Meta> key since
the key code for <ESC> is `^[`; <ESC> may be entered by pressing `C-[`.
The sequence `<ESC>[` (or `^[[`) is the intro code for ANSI codes.

<Meta> key can also be input using <ESC> instead, but when doing this
the ESC key must not be depressed (as another key is pressed) - instead,
ESC is pressed and released, then another key is pressed.
e.g. M-<PageDown> can be input as <ESC><PageDown> (note the absence of dash).


## Modifier keys

Usually, the set of modifier keys include 4 keys:
   1 or 0  bare key
  +1       Shift,   `S-`
  +2       Alt,     `M-`
  +4       Control, `C-`
  +8       Turbo,   `T-`

T C M S
0 0 0 0            PageDown  1
0 0 0 1    Shift + PageDown  1+1
0 0 1 0    Meta  + PageDown  1+2
0 1 0 0    Ctrl  + PageDown  1+4
1 0 0 0    Turbo + PageDown  1+8



Shift key adds +2
Ctrl +5


```
[6~     <PageDown>
[6;2~   <S-PageDown>
[6;3~   <M-PageDown>
[6;4~   <M-S-PageDown>
[6;5~   <C-PageDown>

[6;6~   <C-S-PageDown>
[6;7~   <M-C-PageDown>
[6;8~   <M-C-S-PageDown>

[6;16~  <M-T-C-S-PageDown>
```




## 8-bit characters

>8-bit characters vs meta-prefixed char


`convert-meta`
If `on`, Readline will convert 
*chars with the eighth bit set* into an *ASCII key sequence*
by stripping the eighth bit and prefixing an ESC char,
thereby converting them to a *meta-prefixed key sequence*.

The default value is `on`, but will be set to `off` 
if the locale is one that contains eight-bit chars (like UTF-8).

This variable is dependent on `LC_CTYPE` locale 
category, and may change if the locale is changed.

The communication between terminal emulators (or terminal devices corresponding
to a physical terminals) and applications uses characters. When you press A, the
terminal receives the information "A key, no modifier", but what it sends to the
application running in the terminal is the character 'a'. When you press a 
function key like Up or F1, there's no corresponding character; the terminal 
sends a character sequence beginning with the escape character (byte 27, sometimes
written `\e` or `^[`).

When a terminal emulator such as xterm received a key press event with the Meta
modifier, it translates that key to an escape character followed by the key's
underlying function; e.g. `\ea` (escape, lowercase 'a') when you press Meta+A.


## Meta key and terminfo

`meta-flag` - 'on' forces the use of the 8th bit as *Meta bit*.

`terminfo` manual page documents terminal capabilities including these
  has_meta_key    km     km   has meta key (i.e. sets 8th-bit)
  meta_off        rmm    mo   turn off meta mode
  meta_on         smm    mm   turn on meta mode (8th-bit on)

If the terminal has "meta key" (which is one of the modifier keys),
setting the MSB (8th in 1-indexing) bit of any character transmitted,
can be indicated with 'km'.

Otherwise, software will assume that the 8th bit is parity
and it will usually be cleared.
If strings exist to turn this "meta mode" on and off,
they can be given as 'smm' and 'rmm'.

## ASCII

ASCII (American Standard Code for Information Interchange)
is a character encoding standard for electronic communication.

The first edition of the ASCII standard was published in 1963.
It underwent a major revision in 1967, with the most recent
update in 1986.

7-Bit ASCII (ANSI X3.4-1986)
  American National Standard for Information Systems - Coded Character Sets
  7-Bit American National Standard Code for Information Interchange (7-Bit ASCII)
  *ANSI X3.4-1986* (Technical report)




### ASCII characters and meta

ASCII character set uses 7 bits.
7 bits are enough to represent 128 values.

The rightmost bit, i.e. the most significant bit (MSB)
is not used, at least not to encode an ASCII character.
Whether MSB is set to 0 or 1, as far as ASCII is
concerned, it encodes the same character.
Since the MSB is not used, it may be employed for other
purposes, e.g. as a parity bit.

UTF-8 uses 1-4 bytes to encode Unicode codepoints.
The first 128 characters of Unicode, which correspond one-to-one
with ASCII, are encoded using a single byte, and they have
the same binary value as ASCII (so the MSB is left at 0).



### ASCII Ranges

0x00 - 0x1F  CC
0x20 - 0x2F  punctuation
0x30 - 0x39  numbers
0x3A - 0x40  punctuation
0x41 - 0x5A  uppercase
0x5B - 0x60  punctuation
0x61 - 0x7A  lowercase
0x7B - 0x7E  punctuation
0x7F         DEL

0x80 - 0xA0  CC2
...
0x__ - 0xFF

