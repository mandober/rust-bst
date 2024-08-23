# Positional parameters


- Everything on the command line following a command's name is a positional parameter.  
- Positional parameters are devided into: _options_ and _operands_.
- Operands are non-option positional parameters
  - They are the "payload" that is left after all options have been processed. 
- Options are devided (with respect to their argument) into:  
  - options without argument i.e.  _flags_
  - options with _required argument_
  - options with _optional argument_
- Options are also devided into two groups: _short_ and _long_ options.
- Short option begins with a dash followed by a single character.
  - simple option (flag) is an option without argument, `cmd -x`.  
  - if the option has required argument, it can be written: 
    - _immediately_ after the option character: `cmd -oARG`  
    - as the _following_ parameter: `cmd -o ARG`
  - if the option has optional argument, it must be written:  
    - _immediately_ after the option character: `cmd -oARG`  
  - _Compounded short options_: if several short options are merged after a single dash: `cmd -xyz`  
    - this shorthand requires all (except possibly the last) options are flags: `cmd -xyz ARG`. Here, the last option has a required arg.
    - it can also be written as `cmd -xyzARG`.
- Long option normally begins with double dash followed by the long option name.
  - simple option (flag) is the long option witout an argument: `cmd --long-option`  
  - if the option has required argument, it may be written:
    - as the *following* argument: `cmd --option ARG`
    - after the *equal sign*: `cmd --option=ARG`
  - if the option has optional argument, it must be written after the equal sign: `cmd --option=ARG`  
- __Abbreviation__     
  Long options may be abbreviated, as long as the abbreviation is unambiguous with regards to other long options. For example: `cmd --lo` can be stated instead of `cmd --long-option` if there is no other long option beginning with "lo". Historical alternative form i.e. long option that begins with a single dash is deprecated.
- __Order__ of positional parameters     
  - programs should be able to parse options no matter of their order. 
  - older programs may require that options be stated first, followed by operands.
  - to completely avoid ambiguity, options can be explicitly separated from operands by using the double dash `--` separator, e.g. `cmd -o --opt -- OPER1 OPER2`. In this case everything after the '--' is treated as an operand, even if it looks like a proper option. 
  - if the same option is repeated, the latter will overshadow the former occurrence.
  - if unrecognized option is supplied, it will be discarded.
