# Terminal emulators

## Terminal emulators list

- alacritty
  - https://alacritty.org/
  - hardware accelarated, fast
- kitty
  - https://sw.kovidgoyal.net/kitty/
  - feature full
- lxterminal
  - https://github.com/lxde/lxterminal
- xfce-terminal
  - https://docs.xfce.org/apps/terminal/start
- konsole
  - https://konsole.kde.org/
- st
  - simple fucky-sucky sucklessness
- termonad
  - https://github.com/cdepillabout/termonad
  - configurable in Haskell (but not written in Haskell)
  - lots of configuration option, extreme customization
  - provides hooks to modify default behavior
  - xmonad of terminal emulators
- yakuake
- qterminal
- GNOME Terminal
  - https://help.gnome.org/users/gnome-terminal/stable/
  - https://en.wikipedia.org/wiki/GNOME_Terminal
- GNOME Terminator
  - https://gnometerminator.blogspot.com/p/introduction.html
  - a tool for enhancing GNOME Terminal featuring
  - arranging terminal windows (tabs, grids)
  - drag and drop re-ordering of terminals
  - lots of keyboard shortcuts
  - saving layouts and profiles via GUI preferences editor
  - send (type) commands to arbitrary groups of terminals
- terminology
  - https://www.enlightenment.org/about-terminology.md
  - designed to emulate Xterm as closely as possible in most respects
  - paneled configuration menu
  - Enlightenment Foundation Libraries (EFL) support
  - due to EFL, it works in X11, under a Wayland compositor, or directly in the framebuffer on Linux. This allows replacing the text-mode VT with a graphical one which requires no display system.
  - can use OpenGL for rendering
- xterm
  - classic
  - https://invisible-island.net/xterm/
  - https://en.wikipedia.org/wiki/Xterm
- rxvt
  - classic
  - light on resources, big on features. popular xterm replacement
  - https://rxvt.sourceforge.net/
  - https://en.wikipedia.org/wiki/Rxvt
  - http://cvs.schmorp.de/rxvt-unicode/doc/rxvt.7.html
  - http://cvs.schmorp.de/browse/rxvt-unicode/doc/rxvt.7.html
- rxvt-unicode
  - rxvt-unicode is a fork of the well known terminal emulator rxvt
  - http://software.schmorp.de/pkg/rxvt-unicode.html
- urxvt
  - derived from rxvt






## Terminal devices of old
- VT100
- VT520

## Terminal properties and features

Terminal concepts
- scrollback
- alternate screen
- ANSI escape sequences
- terminfo, termcap


Terminal properties
- modern unicode experience
- ligature support
- true color support
- ANSI escape sequences
- flicker-free
- handles rewrapping correctly


Terminal features
- tab support
  - split tabs
  - sending commands to multiple screens/tabs/frames
- profile support
  - custom key bindings
  - theme management
- bookmark support
- search support
- monitoring support
  - silence monitoring
  - activity monitoring
- jumping to previous prompts in the scrollback
- viewing the output of the last command in a pager
- using mouse to move the cursor while editing prompts
- support for links (URLs)
- support for tooltips
- GPU acceleration
+ true color support
+ ligature support
- display images (graphics) support
- play videos support
- tabs, windows, panes
- multiplexing
- save sessions, reply saved sessions
- plugins



## FAQ
- console vs terminal vs shell
- Where the features of one stop and the features of the other begin, in terms of console, terminal, shell
- shell vs subshell
- external vs internal commands
