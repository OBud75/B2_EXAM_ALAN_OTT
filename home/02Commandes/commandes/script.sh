#!/bin/bash
echo $@

check_argv () {
    if [[ -z "$1" ]]; then
        echo 1;
    elif [[ "$1" -eq 0 ]]; then
        echo 0;
    fi
}

check_argv

case $2 in 
    "hello")
        echo "hellllooo"
        ;;
    "toto")
        echo "totooo"
        ;;
    *)
        echo default
        ;;
esac
