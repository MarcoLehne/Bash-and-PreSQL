#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# prompt welcome dialog and retrieve data from db or create new user
echo Enter your username:
read NAME

GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$NAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$NAME'")

if [[ -z $GAMES_PLAYED ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  INSERT=$($PSQL "INSERT INTO users(username) VALUES('$NAME')")
else
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


# play the game
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
VALID_NUM='^[0-9]+$'
AMOUNT_OF_GUESSES=1

#echo $SECRET_NUMBER


while [[ ! $GUESSED_NUMBER =~ $VALID_NUM || ! $GUESSED_NUMBER == $SECRET_NUMBER ]]
do

  # problem with the guess?
  if [[ ! -z $GUESSED_NUMBER ]]
  then

    ((AMOUNT_OF_GUESSES=$AMOUNT_OF_GUESSES+1))

    if [[ ! $GUESSED_NUMBER =~ $VALID_NUM ]]
    then
      echo That is not an integer, guess again:
    else
      if [[ $GUESSED_NUMBER < $SECRET_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
    fi
  else 
    echo "Guess the secret number between 1 and 1000:"
  fi 
  
  read GUESSED_NUMBER
done

((GAMES_PLAYED=$GAMES_PLAYED+1))
UPDATE=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$NAME'")

#echo $AMOUNT_OF_GUESSES
#echo $BEST_GAME

if [[ -z $BEST_GAME || $AMOUNT_OF_GUESSES < $BEST_GAME ]]
then 
  #echo I am updating..
  UPDATE=$($PSQL "UPDATE users SET best_game = $AMOUNT_OF_GUESSES WHERE username = '$NAME'")
fi

echo "You guessed it in $AMOUNT_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"