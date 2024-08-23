# Keycodes

Upon pressing or releasing any single key, Linux goes through several steps:
- pressed or released key produces a *scancode*
- keyboard driver converts scancodes to *keycodes*,
  possibly combined with *modifiers*
- kernel converts keycodes to tty input characters via *kernel keymaps*
- keys and key combinations that are not characters
  may need further processing by the kernel or applications.

If we press more than one key, the result is usually different.

## Key Combinations

We can also input key combinations by pressing more than one key:
- one after the other, holding the first
- one after the other, releasing the first
- simultaneously

The last case is trivial and simply produces the scancodes of the constituent keys.
On the other hand, the second scenario involves dead keys.
Finally, both the second and third options usually involve modifiers.

**Dead keys** change or add to the next key scancode.

## Modifiers

Modifiers can be keys or even key combinations that change 
the behavior of other keys when pressed along with them.

There may be many modifiers, but few are the standard ones:

+----------+-----------+-------+---+--------------------------------------------
| Key      | Name      | Value | K | Notes
+----------+-----------+-------+---+--------------------------------------------
| ⇧ Shift  | Shift     |   +1  | S | LShift and RShift
+----------+-----------+-------+---+--------------------------------------------
| ⎇ Alt    | Alternate |   +2  | M | Meta key. Left Alt. Can be input with ESC
+----------+-----------+-------+---+--------------------------------------------
| ^ Ctrl   | Control   |   +4  | C | LCtrl and RCtrl
+----------+-----------+-------+---+--------------------------------------------
| ⊞ Win    | Windows   |   +8  | T | LWin (and RWin)
+----------+-----------+-------+---+--------------------------------------------
| ⇮ AltGr  | AltGrave  |       |   | Alternate Graphic. RAlt. Same as LAlt.
+----------+-----------+-------+---+--------------------------------------------
| ◆ Meta   | Meta      |       |   | Original modifier key at MIT
+----------+-----------+-------+---+--------------------------------------------
| ✦ Hyper  | Hyper     |       |   | MIT-specific meta key
+----------+-----------+-------+---+--------------------------------------------
| ❖ Super  | Super     |       |   | Win-like key predecessor at MIT
+----------+-----------+-------+---+--------------------------------------------
| ⎄  Comp  | Compose   |       |   | Compose key
+----------+-----------+-------+---+--------------------------------------------
|   Fn     | Function  |       |   | Alter F-key function
+----------+-----------+-------+---+--------------------------------------------
| ⌥ Option | Option    |       |   | Alt for Mac
+----------+-----------+-------+---+--------------------------------------------
| ⌘ Cmd    | Command   |       |   | Win for Mac
+----------+-----------+-------+---+--------------------------------------------


## Meta key

In short, the actual Meta key can be considered the original Hyper, Super, Win, or Cmd key.
As such, most operating systems process it equivalently, regardless of its name and icon.

However, all of these keys can be ignored by terminals. 
Terminals usually mainly consider Ctrl, Shift, and Alt.
In that context, Meta is equivalent to Alt.

Then again, Meta can also be a catch-all term for custom 
hardware and software-specific keys and combinations:
  screen – Ctrl+A
  tmux – Ctrl+B
  Bash – Ctrl+V
  xterm, ncurses – virtual or actual Meta key
  ANSI – Ctrl+[, i.e., Control Sequence Introducer (CSI)

In fact, some of these keys are a kind of protection 
against lower-level mechanisms hijacking their shortcuts.

Critically, no Meta is sent directly to the shell or applications 
but is instead interpreted only in combinations. 
Alternatively, applications can detect such keys by listening for 
key press events as detected and sent by the terminal (emulator).

>Perhaps the most concrete definition of Meta is a key, key combination, 
>or command character that doesn’t convert to a single normal character 
>directly but augments the following keys or characters.

Despite the versatile nature of Meta, it’s often denoted simply as `M`.

Since some keys (e.g. arrows) don't have a character representation,
they must be presented with other means. We can produce the effect 
of such special keys via the *CSI* `\e[` i.e. `C-[` prefix.

Sequences
- ESC                               sequence starting with `ESC` (\x1B)
- CSI  Control Sequence Introducer: sequence starting with `ESC [` or CSI (\x9B)
- DCS  Device Control String:       sequence starting with `ESC P` or DCS (\x90)
- OSC  Operating System Command:    sequence starting with `ESC ]` or OSC (\x9D)

Any whitespaces between sequences and arguments should be ignored - it is just for readability.

We can continue our earlier chain of actions around a key press or release:
- GUI generates a key event
- if the key event isn’t handled by the GUI, it might go to our terminal (emulator)
- if the key event isn’t handled by our terminal (emulator), it might go to our shell
- if the key event isn’t handled by our shell, it might go to our application

Since Meta isn’t part of X, it often goes down the chain, usually to the terminal, 
most often xterm. This way, its interpretation depends on its configuration and 
possibly some self-explanatory settings:
  metaSendsEscape
  altIsNotMeta
  altSendsEscape

Thus, even if we know a key has reached xterm, the 
result has to be deduced based on the current state.


## Mouse keys + modifiers

Mouse clicks keycodes contain the coordinates.
Terminal window: 211×51 characters

[<1;1;1M     LC at top-left
[<1;211;1M   LC at top-right
[<1;1;51M    LC at bottom-left
[<1;211;51M  LC at bottom-right

[<0;37;24M LC
[<1;37;26M RC
[<2;37;25M MC



[<4;50;28M
[<6;50;29M
[<5;52;30M
[<5;58;31M
[<5;66;40M
[<5;168;18M
[<1;210;49M

[<0;81;46M
[<1;81;46M
[<2;81;46M

[<4;81;46M
[<5;83;46M
[<6;81;46M

[<0;68;45M
[<1;63;45M
[<2;67;45M

[<0;83;46M
[<1;82;46M
[<2;83;46M

[<32;56;45M  Turbo + LC


## Refs

* ANSI Escapes seq
https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797


