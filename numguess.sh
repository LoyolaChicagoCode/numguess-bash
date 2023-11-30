#!/usr/bin/bash

# use first argument as number
# or pick one at random

NUMBER=$1
if [ -z "$1" ]; then
    NUMBER=$(shuf -i 1-100 -n 1)
fi

echo number is $NUMBER

read -p "What's your guess? " GUESS

# TODO check validity of input

while [ "$GUESS" -ne "$NUMBER" ]; do

    # TODO feedback to user - too low/high

    # TODO count number of steps -
    # terminate if max exceeded
    
    echo "Try again"
    read -p "What's your guess? " GUESS

done

echo "You got it"
