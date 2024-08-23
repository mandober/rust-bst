# NAME
`explode` - convert a string to array


## SYNOPSIS
`explode STR [-c|-d DELIM] [-o ARRAYNAME]`


## DESCRIPTION
Convert a string to array by splitting it on DELIM substring. Returns an indexed array of strings, each of which is a substring of string, formed by splitting string on boundaries delimited by the DELIM.


## OPTIONS
`-c, --char, --chars`    
With this option DELIM is a character boundary i.e. each element of array will contain a single character from string; final array will not have empty elements.

`-d, --delim, --delimiter DELIM`    
DELIM can be a single character or multi-character substring. If skipped, the DELIM defaults to (in order of precedence): colon (:), slash (/), comma (,), dot (.), dash (-), semicolon (;), pipe (|), whitespace.

`-o, --out ARRAYNAME`   
ARRAYNAME is user supplied name for resulting indexed array (must be a valid identifier). If not provided, it defaults to EXPLODED.   


## OPERANDS
`STR`    
String STR to split, passed by name (without $). Required.


## STDOUT
Help, usage, version (if explicitly requested).


## STDERR
Error messages, help and usage.


## ENVIRONMENT
This function will create a new variable in the environment; the name of this variable will be a user provided string (with -o option) or EXPLODED if no name is provided. This variable is an indexed array, whose value is the resulting array created by this function.


## RETURN CODE:
0  success    
1  failure    
2  Missing parameters    
3  Parameter is already an array    
4  Unsupported getopt version    
5  Parameter empty    
6  Invalid identifier    


## EXAMPLES

```shell
$ string=a:b:c:d
$ explode -d: -oaux string
$ # use typeof utility to dump arrays:
$ typeof aux
$ # outputs:
 Name: aux
 Type: indexed array [4]
 no.    key  value   len
 1.     [0]: a         1
 2.     [1]: b         1
 3.     [2]: c         1
 4.     [3]: d         1
```


## SEE ALSO
[typeof](https://github.com/mandober/typeof) - utility for pretty-printing bash arrays.



### ID TAG
```
   FILE: explode
   TYPE: bash function
    WEB: https://github.com/mandober/barf
LICENSE: MIT
 AUTHOR: Ilic Ivan <ilicivan@zoho.com>
   DATE: 09-Sep-2017 (last revision)
```