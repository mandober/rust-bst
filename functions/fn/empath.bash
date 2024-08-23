#!/bin/bash

# Check and remove duplicated PATH entries.

function empath {
  # convert $PATH to path array
  local path=( ${PATH//:/ } ) 

  for i in ${!path[@]}; do
    printf "%2s %s (%2s)\n" "$i" "${path[$i]}" "${#path[$i]}"
  done

}
