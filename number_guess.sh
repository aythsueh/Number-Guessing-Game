#!/bin/bash

# build number guessing game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generates a random number 1 - 1000
SECRET=$(( RANDOM % 1000 + 1 ))
echo $SECRET

user_info() {
  # get user's name
  echo "Enter your username:"
  read USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM number_guess WHERE username='$USERNAME'")

  # if user not exist
  if [[ -z $USER_ID ]]
  then
    # add new user into database
    NEW_USER_RESULT=$($PSQL "INSERT INTO number_guess(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
    USER_ID=$($PSQL "SELECT user_id FROM number_guess WHERE username='$USERNAME'")
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    GAMES_PLAYED=0

  # if user exists
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE user_id=$USER_ID")
    USERNAME=$($PSQL "SELECT username FROM number_guess WHERE user_id=$USER_ID")
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

guess_game() {
  # ask user to take a guess
  echo -e "Guess the secret number between 1 and 1000:"
  read GUESS

  NUMBER_OF_GUESS=1

  while [[ $GUESS != $SECRET ]]
  do
    # if guess not integer
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then 
      echo -e "That is not an integer, guess again:"
      read GUESS

    else
      # if guess greater than target number
      if [[ $GUESS > $SECRET ]]
      then
        echo -e "It's lower than that, guess again:"
        read GUESS

      # if guess less than target number
      else
        echo -e "It's higher than that, guess again:"
        read GUESS
      fi
    fi

    # counting tries
    (( NUMBER_OF_GUESS++ ))
  done

  # get the target number
  echo -e "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $SECRET. Nice job!"
}

# get user info
user_info

# start a new game
guess_game
GAMES_PLAYED_UPDATE=$GAMES_PLAYED+1

# update database based on the result
USER_BEST_RESULT=$($PSQL "UPDATE number_guess SET best_game=$NUMBER_OF_GUESS WHERE user_id=$USER_ID")
USER_PLAYED_RESULT=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED_UPDATE WHERE user_id=$USER_ID")



