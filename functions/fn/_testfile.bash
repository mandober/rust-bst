#!/bin/bash

#| Detect if file is being sourced or executed.
#| If file is being sourced, the first entry in the BASH_SOURCE array should be the file's name

## export if so else execute main function with supplied args
echo '${BASH_SOURCE[0]} is being sourced under the name $0'
if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  echo "${BASH_SOURCE[0]} is being sourced under the name $0"
  echo "Its realpath is $(realpath $0)"
else
  echo "${BASH_SOURCE[0]} is being executed under the name $0"
  echo "Its realpath is $(realpath $0)"
fi
