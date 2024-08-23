#!/bin/bash
#=========================================================================
# FILE: msystem.bash
# REPO: https://github.com/mandober/posix-dotfiles
# DATE: 2017-05-18
# DESC: id the current (POSIX) system: cygwin, msys2, migw64, wsl, linux
#       make available `MSYSTEM` env var, as in, `MSYSTEM=CYGWIN`
#=========================================================================


# MSYS: Msys2x64
# MSYSTEM=MSYS
# already has this env var defined
# uname: `MSYS_NT-10.0 drivan 2.7.0(0.306/5/3) 2017-02-14 08:57 x86_64 Msys`


# MSYS: MinGW64
# MSYSTEM=MINGW64
# already has this env var defined
# uname: `MINGW64_NT-10.0 drivan 2.7.0(0.306/5/3) 2017-02-14 08:57 x86_64 Msys`


# Cygwin
# MSYSTEM=CYGWIN
# uname: `CYGWIN_NT-10.0 drivan 2.8.0(0.309/5/3) 2017-04-01 20:47 x86_64 Cygwin`
if [[ "$(uname -a)" =~ ^CYGWIN ]]; then
    export MSYSTEM=CYGWIN
    return 0
fi


# Linux-like
if [[ "$(uname -a)" =~ ^Linux ]]; then
    ls /mnt/c/Windows &>/dev/null
    if (($? == 0)); then
        # WSL
        # Windows Subsystem for Linux
        # uname: `Linux MACH 3.4.0+ #1 PREEMPT Thu Aug 1 17:06:05 CST 2013 x86_64 x86_64 x86_64 GNU/Linux`
        export MSYSTEM=WSL
    else
        # Linux proper
        export MSYSTEM=LINUX
    fi
    return 0
fi

return 1