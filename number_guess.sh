#!/bin/bash

# build number guessing game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generates a random number 1 - 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $SECRET_NUMBER

user_info() {
  # get user's name
  echo "Enter your username:"
  read USERNAME
  USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM number_guess WHERE username='$USERNAME'")

  # if user not exist
  if [[ -z $USER_INFO ]]
  then
    # add new user into database
    NEW_USER_RESULT=$($PSQL "INSERT INTO number_guess(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    GAMES_PLAYED=0
    BEST_GAME=0

  # if user exists
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

guess_game() {
  # ask user to take a guess
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  (( GAMES_PLAYED++ ))
  NUMBER_OF_GUESSES=1

  while [[ $GUESS != $SECRET_NUMBER ]]
  do
    # if guess not integer
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then 
      echo "That is not an integer, guess again:"
      read GUESS

    else
      # if guess greater than target number
      if [[ $GUESS > $SECRET_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        read GUESS

      # if guess less than target number
      else
        echo "It's higher than that, guess again:"
        read GUESS
      fi
    fi

    # counting tries
    (( NUMBER_OF_GUESSES++ ))
  done

  # get the target number
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

# get user info
user_info

# start a new game
guess_game

# update database based on the result
if [[ $BEST_GAME < 1 ]]
then
  USER_BEST_RESULT=$($PSQL "UPDATE number_guess SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
else
  if [[ $NUMBER_OF_GUESSES < $BEST_GAME ]]
  then
    USER_BEST_RESULT=$($PSQL "UPDATE number_guess SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
  fi
fi

USER_PLAYED_RESULT=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
