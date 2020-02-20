#!/bin/bash
echo "Enter commit message >> "
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

shaofpass="(stdin)= 9c664381e5b87b01ae3a9eb599830a8d504e3bb8"

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

