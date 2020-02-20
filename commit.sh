#!/bin/bash
if [ "$1" == "--h" ] | [ "$1" == "-h" ] | [ "$1" == "-help" ] ; then
    echo "Commands for "
    echo -e "1. To change password \n    \$commit -cp"
    echo -e "2. To update\n    \$commit -update "
else
    echo -e "Enter commit message \n>> "
    read -r message
    #echo $message
    unset password
    unset shapassword
    var="$(pwd)"
    cd "$var"
    echo -n "Enter password to commit changes to github >> "

    stty -echo

    charcount=0
    while IFS= read -p "$prompt" -r -s -n 1 ch
    do
        if [[ $ch == $'\0' ]] ; then
            break
        fi
        if [[ $ch == $'\177' ]] ; then
            if [ $charcount -gt 0 ] ; then
                charcount=$((charcount-1))
                prompt=$'\b \b'
                password="${password%?}"
            else
                PROMPT=''
            fi
        else
            charcount=$((charcount+1))
            prompt='*'
            password+="$ch"
        fi
    done

    stty echo
    echo
    #echo -n "hello" | openssl sha1
    hash=$( echo -n $password | openssl sha1 )
    #echo $hash 

    shaofpass="(stdin)= b1b3773a05c0ed0176787a4f1574ff0075f7521e"

    if [[ "$shaofpass" == "$hash" ]] ; then
        git add .
        git commit -m "$message"
        git push origin master
        echo "commit sucessfull :-)"
    else 
        echo "Password is incorrect"
    fi
    #shapassword = password
    #echo "$password"
    #echo "$shaofpass"
    #echo "$variblehash"
fi

