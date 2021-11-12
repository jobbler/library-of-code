# Configuration Files

This following will read a configuration file into the associative array VAR.

I find reading into an associative array very flexible.
It makes it easier to add variables without extra coding.

## Format
```
# at the beginning of a line is a comment
; at the beginning of a line is a comment

key1: value1
key2: value2
```

## Code
``` bash
ini=$1

usage() {
    echo "usage: ${0##*/} CFG_FILE"
    echo "where CFG_FILE has a format of:"
    echo "    # at the beginning of a line is a comment"
    echo "    ; at the beginning of a line is a comment"
    echo "    key1: value1"
    echo "    key2: value2"
    exit
}

[[ -z ${ini:+isset} ]] && usage

## Parse the ini file
#
declare -A VAR
[[ -f ${ini} ]] && {

    while read -r key value
    do
        VAR[${key//:}]=$value
    done < <( sed -E '/^#|^;|^\s*$/d' ${ini})
}
```

## Nice to haves:

> - [ ] It would be nice to have the script honor variable substitution
> Something like reference a previous defined key in the file as %key% and have it substituted.
> - [ ] Also maybe apply environment variables as an override to config file variables.
Search for a unique var name `cluster_name` and `cluster_ip`
> - [ ] Maybe also cli options to overide.
I figure precedence from high to low is: cli overrides environment which overides confi file.
