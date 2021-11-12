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

## Nice to have

> - [ ] passing associative arrays to Functions
> - [ ] structured returns. Maybe returning something that can be easily used as an associative array? To include array{text}, array{message}, array{return_code}
> - [ ] create a structure heading for the functions. Like explain the options and what is required if passing an associative array. Explain posible return codes and message strings. Also explain what the function does.
