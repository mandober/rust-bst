# htop

htop 3.0.5 (2019)

Process state:
  R: running
  S: sleeping
  T: traced/stopped
  Z: zombie
  D: disk sleep

## Keys

Arrows       scroll process list
Digits       incremental PID search              

Space        tag process
c            tag process and its children
U            untag all processes

F3 /         incremental name search
F4 \         incremental name filtering
F9 k         kill process/tagged processes
                                            
F7 ]         higher priority (root only)
F8 [         lower priority (+ nice)

p            toggle program path
m            toggle merged command
a            set CPU affinity
Z            pause/resume process updates
e            show process environment
u            show processes of a single user
i            set IO priority
H            hide/show user process threads
l            list open files with lsof
K            hide/show kernel threads
x            list file locks of process
F            cursor follows process
s            trace syscalls with strace
+ -          expand/collapse tree
w            wrap process command in multiple lines
N P M T      sort by PID, CPU%, MEM% or TIME
I            invert sort order                 
F6 > .       select sort column               


F5 t         tree view
F1 h         show this help screen
F2 C S       setup
F10 q        quit
