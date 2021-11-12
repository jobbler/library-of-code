# Reading arguments

## Script

The following accepts two arguments as indicated by the `:df:`

The first colon tells getopts to not complain about options.

The colon after the `f` tells getopts that the `-f` option will take an argument.

Shifting the OPTIND allows grabbing any positional parameters provided after the options. Positional parameters must be specified after options.

``` bash
#! /bin/bash

while getopts ":df:" opt
do
  case ${opt} in
    d )
        display_log=1
        ;;
    f )
        file=$OPTARG
        ;;
  esac
done

shift $((OPTIND-1))

argument1=$1
```

> You can also check the number of positional parameters passed on the command line.
You can use the following instead of getops or it can be used with getopts.
>
> If used with getopts, you can check the parameters provided after the options.
> ``` Bash
> # Check if an argument was passed on command line.
> : ${1:?"mkjail: Missing operand"}
>
> # Check if at least three arguments were passed on command line.
> : ${3:?"mkjail: Missing operand"}

## Function

When using options to a function, you must declare OPTIND, opt, and OPTARG as local variables.

``` bash
test_function() {}
  local OPTIND opt OPTARG
  local display_log
  local file
  local argument1

  while getopts ":df:" opt
  do
    case ${opt} in
      d )
          display_log=1
          ;;
      f )
          file=$OPTARG
          ;;
    esac
  done

  shift $((OPTIND-1))

  argument1=$1
}
```
