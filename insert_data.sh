#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

insert_team(){
  TEAM_NAME=$1
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")

  if [[ -z $TEAM_ID ]]
  then
    INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')");    
    if [[ $INSERT_RESULT=="INSERT 0 1" ]]
    then 
      echo "$TEAM_NAME inserted";
    fi 

  fi
}

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [[ $YEAR != "year" ]]
    then 
      #insert teams if they are not in the table
      insert_team "$WINNER";
      insert_team "$OPPONENT";

    #get their ids to insert them into games table

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");

    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)");
      if [[INSERT_GAME=="INSERT 0 1"]]
      then 
        echo "Inserted games $YEAR $ROUND $WINNER vs $OPPONENT";
      fi
    fi
done
