###############################################################################
# green_bash

###############################################################################
# SETUP
###############################################################################
# you have to include this file in ~/.bashrc, just take it the last line
# source <this file absolute location>
# and fill the the varibles below

# if you fill a boolean variable, yes is true otherwise false

###############################################################################
# REQUIRED

# this project dir absolute path (which dir include bashrc.sh)
DIR_GREEN_BASH=""

###############################################################################
# OPTIONAL

GREEN_BASH_DEBUG=no

# PS1_GIT
# if you want this function, you have to find unset color_prompt in your .bashrc, and delete it
# ( "unset color_prompt force_color_prompt" -> "unset force_color_prompt" in my case)
ENABLE_PS1_GIT=yes

###############################################################################
# END OF SETUP
###############################################################################

PROJECT_PAGE="https://github.com/somla/green_bash"

if [ ! -f "$DIR_GREEN_BASH/bashrc.sh" ]; then
    echo "Please Install green bash"
    echo "\$DIR_GREEN_BASH error"
    echo "See more at project page: $PROJECT_PAGE"
    return
fi

function green_bash_load_file {
    local src_file="$1";
    if [ -f "$DIR_GREEN_BASH/$src_file" ]; then
        . $DIR_GREEN_BASH/$src_file;
    elif [ "$GREEN_BASH_DEBUG" = yes ]; then
        echo "Error: $DIR_GREEN_BASH/$src_file not exist"
    fi
}

if [ "$ENABLE_PS1_GIT" = yes ]; then
    green_bash_load_file ps1_git.sh
fi

# general bash variables, functions, aliases
green_bash_load_file bash_variables.sh
green_bash_load_file bash_functions.sh
green_bash_load_file bash_aliases.sh

# current environment bash variables, functions, aliases and other sources
green_bash_load_file my_env/bash_variables.sh
green_bash_load_file my_env/bash_functions.sh
green_bash_load_file my_env/bash_aliases.sh
green_bash_load_file my_env/bash_sources.sh

if [ "$GREEN_BASH_DEBUG" != yes ]; then
    unset DIR_GREEN_BASH
    unset ENABLE_PS1_GIT
    unset GREEN_BASH_DEBUG
    unset PROJECT_PAGE
    unset green_bash_load_file
fi