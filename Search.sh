#!/bin/bash
#Assignment 1
#Mohamad Al-Jaf
#500728521

while echo -n "Player name? "
      read name
      [ $name != "ZZZ" ] #continue if input isn't ZZZ
do
  if matches="$(grep "^.\{11,26\}$name" emplist)" #Searches only the player field
  then
    while : #loops until the break statement is reached
    do
      echo -n "See target (T/t) or team name (M/m)? "
      read option
      option=${option,,} #changes the string to lowercase

      if [ $option == "t" ]
      then
        echo "$(echo "$matches" | cut -c12-26,40-54)" #Displays the targets
      elif [ $option == "m" ]
      then
        echo "$(echo "$matches" | cut -c12-26,27-39)" #Displays the team name
      else
        echo "Please enter only T or M."
        continue #continues the loop until user enters a valid input
      fi
      break #if the input is valid then breaks out of the loop
    done
  else
    echo "No such player." #player not found, case sensitive
  fi
done
