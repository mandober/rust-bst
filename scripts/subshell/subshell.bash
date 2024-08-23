#!/bin/bash


# what does a subshell see
# does it really inherits everything defined in the parent shell

# parent shell

# source the file "parent.bash" to load the "parent" function
. ./parent.bash

# call the parent function
parent

test () {
  echo "test am I"
}
