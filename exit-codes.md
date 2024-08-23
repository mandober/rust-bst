# Exit status


126   command is found but cannot be invoked
127   command cannot be found

144   when a command was interrupted by SIGPIPE signal




cmd | head -1
you may observe 141 (or 269 with ksh93) exit status of cmd,
but this is because cmd was interrupted by a SIGPIPE signal
when 'head -1' terminated after having read one line.
https://cfajohnson.com/shell/cus-faq-2.html#Q11


SIGPIPE is 13, so 144 - 13 = 131
meaning that 132 is SIGHUP?
             133 is SIGINT? it is 130!

So, 128 is the upper limit (half a byte)
and 128 + SIG value = SIG error exit code
thus, 
      128 +  1 (SIGHUP)    = 129 exit code
      128 +  2 (SIGINT)    = 130 exit code
      128 +  3 (SIGQUIT)   = 131 exit code
      128 +  4 (SIGILL)    = 132 exit code
      128 +  5 (SIGTRAP)   = 133 exit code
      128 +  9 (SIGKILL)   = 137 exit code
      128 + 13 (SIGPIPE)   = 141 exit code
      128 + 16 (SIGSTKFLT) = 144 exit code
      128 + 20 (SIGTSTP)   = 148 exit code
      128 + 21 (SIGTTIN)   = 149 exit code
      128 + 22 (SIGTTOU)   = 150 exit code


 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU	    25) SIGXFSZ
26) SIGVTALRM	  27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS

34) SIGRTMIN    35) SIGRTMIN+1	36) SIGRTMIN+2	37) SIGRTMIN+3
38) SIGRTMIN+4	39) SIGRTMIN+5	40) SIGRTMIN+6	41) SIGRTMIN+7	42) SIGRTMIN+8
43) SIGRTMIN+9	44) SIGRTMIN+10	45) SIGRTMIN+11	46) SIGRTMIN+12	47) SIGRTMIN+13
48) SIGRTMIN+14	49) SIGRTMIN+15

50) SIGRTMAX-14	51) SIGRTMAX-13	52) SIGRTMAX-12
53) SIGRTMAX-11	54) SIGRTMAX-10	55) SIGRTMAX-9	56) SIGRTMAX-8	57) SIGRTMAX-7
58) SIGRTMAX-6	59) SIGRTMAX-5	60) SIGRTMAX-4	61) SIGRTMAX-3	62) SIGRTMAX-2
63) SIGRTMAX-1	64) SIGRTMAX	
