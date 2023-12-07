#!/bin/bash

steps=0
max_steps=10
max_number=100

# use first argument as number
# or pick one at random

# use quotes in case the first argument is empty (not provided)

number=$1
if [[ -z "$number" ]]; then
    number=$(shuf -i 1-$max_number -n 1)
fi

# TODO comment out after testing

echo "DEBUG: Number is $number"

# multi-line output (with variable subsitution)

cat <<EOF
Hi and welcome to the number guessing game!
I've made up a number between 0 and $max_number
Your job is to guess this number within at most $max_steps steps.
Good luck!
EOF

while true; do

    step=$((step+1))

    # terminate if max number of steps exceeded

    if [[ $step -gt $max_steps ]]; then
	echo "Sorry, that's more than $max_steps steps! You're done."
	exit
    fi
    
    # check validity of input and give feedback

    read -p "STEP $step: What's your guess? " guess
    if [[ ! $guess =~ ^[0-9]+$ ]]; then
	echo "Your input $guess isn't a valid number"
    elif [[ $guess < $number ]]; then
	echo "Oops, that was too low."
    elif [[ $guess > $number ]]; then
	echo "Oops, that was too high."
    else
	echo "Congratulations, you got it after only $step step(s)!"
	break
    fi
done

echo "Come back soon!"
