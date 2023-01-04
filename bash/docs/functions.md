# Functions

This will source the functions that have the suffix of .funct into the script.

``` bash
## Source the functions from the $fundir directory
#  Defaults to the functions subdirectory where the
#  executable is located.
#
: ${fundir:=${0%/*}/functions}

for fun in ${fundir}/*.funct
do
    source ${fun}
done
```

Functions
Generally use an associative array that contains the variables used inside the function.
Set local variables to be used inside the function.
Assign default values if they are not set in the array.

``` bash
example() {
  local text=$*                 # Set text to script arguments
  local dir=${VAR[dir_example]} # Set to value of key in VAR

  : ${text:=hello}              # Set default value of text
  : ${dir:=${VAR[dir_default]}} # Set default to key in VAR
  : ${dir:=/home}               # Set default value if key
                                # not in VAR
}
```


## Default function
This function should be named so that it will be the first function called. For example 00-defaults.funct.
It should contain statements to set default values for needed variables.
This can also contain conditional statements to set variables as well as logic checks.
For this to work, the functions must be read after the configuration file.

00-defaults.funct
``` bash
: ${VAR[pullsecret]:=~/pull-secret.json}
: ${VAR[local_repo]:=ocp4}
: ${VAR[local_registry]:=registry.example.org:5000}

: ${VAR[bits]:=DEV}

[[ $VAR[bits] == GA ]] \
    && $VAR[url]=https://ga/url \
    || $VAR[url]=https://dev/url
```

## Guidelines for functions
``` bash
test_function() {

# Description:  This function takes two values.
#               The default behavior is to add the values
#               and return if the result is even or odd.

# Options:
#               -m      multiply values instead
#               -s      substract second value from the first

# Arguments:
#               value1    The first value to use. required
#               value2    The second value to use. required

# Returns:      0 on pass, 1 on fail
#               or returns string
#               If returns string, prefix with "FAILURE:" if fails.
#               Else return useable string.

}
```

## Passing array references to a function
Array references can be passed to a bash function (``Bash 4.3+``).
This makes it easy to pass a lot of information to a function.
> Warning: The function can modify the contents of the array unless it is marked read-only before calling the function.

``` bash
declare -A ta=([one]=a [two]=b [three]=c) # Declare and associative array

aref() {
    local -n aray=$1      # Make $aray a pointer to the array passed to it.

    echo ${aray[three]}
    echo ${aray[two]}
    echo ${aray[one]}
}

readonly ta               # Mark the ta array readonly so the function cannot modify it.
aref ta
```

## Returns
By default, bash functions return the exit status of the last command executed in them.
This feature can be used to allow bash functions to return bot a return code and a return string.

The following function will take two arguments and return them. The first will be a return code and the second is a string.
If called as the last command executed in a function, the calling function will return a return code (``$?``) and a return string.

``` bash
rc() {
  # Descriptions: This function is used to return a string and also a value from other functions.
  #    Call the function at then end of any other functions.
  #    It takes two arguments:
  #        The first argument is a return code for the function to return.
  #        The second argument is an optional string to echo to STDOUT.
  #    If the first argument is not specified, the function will return a code of 2.              

  local rc=$1 # return code
  local rs=$2 # return string

  : ${rc:=2}  # Set rc to 2 if unspecified.

  echo $rs
  return $rc
}
```
