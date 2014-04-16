fancy_prompt() {
    # This needs to go first
    LAST_COMMAND=$?

    # set up fancy colours
    RED='\[\e[01;31m\]'
    GREEN='\[\e[01;32m\]'
    YELLOW='\[\e[01;33m\]'
    BLUE='\[\e[01;34m\]'
    RESET='\[\e[00m\]'

    # and fancy characters
    FANCYX='\342\234\227'
    CHECKMARK='\342\234\223'

    if [[ $LAST_COMMAND == 0 ]]; then
        ERROR_INDICATOR="$GREEN$CHECKMARK"
    else
        ERROR_INDICATOR="$RED$FANCYX"
    fi

    ENV_NAME=""
    if [ -n "$VIRTUAL_ENV" ]; then
        ENV_NAME="$YELLOW($(basename $VIRTUAL_ENV)) "
    fi

    # set the alternative hostname when the file is present
    if [ -e /etc/cname ]; then
        HOST=$(cat /etc/cname)
    else
        HOST="\\h"
    fi

    if [[ $EUID == 0 ]]; then
        USERHOST="$RED$HOST"
    else
        USERHOST="$GREEN\\u@$YELLOW$HOST"
    fi

    # set the prompt
    PS1="$ERROR_INDICATOR $ENV_NAME$USERHOST"
    PS1+="$RESET:$BLUE\\w\\\$$RESET "

    case "$TERM" in 
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
    esac;
}
PROMPT_COMMAND='fancy_prompt'
