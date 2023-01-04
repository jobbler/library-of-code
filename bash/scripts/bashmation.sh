#! /bin/bash

# Name: bashmation
# Descripion: this is a bash implementation of an automation framework.
# Info: The idea is similar to other automation frameworks such as ansible.
# Info: However, more people know bash so this should be an easier learning curve
# Info: especially for expansion of the module library.

# Info: Each module should be able to accept the following commands:
# Info:     help       - Provides a help of options and commands it accepts
# Info:     check      - Check the module instead of executing
# Info:     execute    - Execute the module

# Info: Each module should return an array that contains and exit code and any other string(s)
# Info:     The exit code should be prefixed with RC: 
# Info:     Example:
# Info:         RC: 0
# Info:         Status: User created
# Info:         Data: sly
# Info:         Data: steve
# Info:         Data: maria

# Info:     There are only two valid exit codes. Reasons for 
# Info:         0  - Success
# Info:         1  - failure

moduless can be run sync or async

ignore the following
# Info: Modules can be native and written as a bash function
# Info: Or they can be non-native and written in any language desired as long as it follows the above requirements.

# Info: Native modules will be read in at run time and non-native modules will be executed when 

