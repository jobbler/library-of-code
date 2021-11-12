# String Manipulation

## Globbing

To use some of the extended Bash pattern matching operators, you must enable exteded globbing.

``` bash
# To enable extended globbing
shopt -s extglob

# To disable extended globbing
shopt -u extglob
```

## Matching

### From beginning of string
The pound `#` matches from the beginning of the string.
A single pound `#` matches the shortest pattern, a double pound `##` matches the longest pattern (greedy).

### From end of string
The percent `%` matches from the end of the string.
A single percent `%` matches the shortest pattern, a double percent `%%` matches the longest pattern (greedy).

## Stripping Spaces

### Strip leading spaces
``` bash
status="${status##*( )}"
```

### Strip trailing spaces
``` bash
status="${status%%*( )}"
```

## Directory and File Names

To strip the last entry from a directory name, In other words strip the last slash and everything behind it.

### Minimum match from the end
``` bash
PWD=/usr/share/bin

${PWD%/*}

# Returns /usr/share
```

### Maximum match from the end

``` bash
PWD=/usr/share/bin

${PWD##*/}
# Returns bin
```
