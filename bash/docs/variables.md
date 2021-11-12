
# Variable Assignment

## Setting default values
This will set VAR to VALUE if VAR is unset.
``` bash
: ${VAR:=VALUE}
```

## Checking if variables are set
The ``${VAR:+isset}`` returns the string “isset” if VAR is not empty.
It returns nothing if VAR is unset or an empty string `""`.

### Test if a variable is set
``` bash
[[ -n ${VAR:+isset} ]] && echo variable is set
```

### Test if a variable is not set
``` bash
[[ -z ${VAR:+isset} ]] && echo variable is not set or is empty
```

## Erroring

The question mark `?` operator will write an error to STDERR.
If this is in a script, it will exit the script.
If it is not in a script (interactive shell), then it will substiture the value of the Error.

``` bash
# Exit if varName is not defined or is empty
: ${varName:?Error varName is not defined or is empty}

# Check if an argument was passed on command line.
: ${1:?"mkjail: Missing operand"}

# Check if at least three arguments were passed on command line.
: ${3:?"mkjail: Missing operand"}
```
