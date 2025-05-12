# 🏆 World Cup Database Project

This is my solution for the [Build a World Cup Database project on freeCodeCamp](https://www.freecodecamp.org/learn/relational-database/build-a-world-cup-database-project/build-a-world-cup-database).

## 📌 Overview

This project involves designing and querying a PostgreSQL database that stores information about FIFA World Cup games and teams. The main focus is on creating tables, importing data from CSV files, and running SQL queries to extract insights.

## 📁 Project Contents

- `worldcup.sql`: Creates and populates the database with data from `games.csv` and `teams.csv`.
- `queries.sql`: Contains SQL queries that answer specific questions (e.g., most goals, number of champions).
- `games.csv`: Raw data with match results.
- `teams.csv`: Team names used in the tournament.

## ⚙️ Technologies Used

- PostgreSQL
- SQL
- Bash

## 🛠️ How to Run

1. Clone the repository:

   git clone https://github.com/giannis07/fcc-worldcup-db.git  
   cd fcc-worldcup-db

2. Run the setup script to create and populate the database:

   psql -f worldcup.sql

3. Run the queries:

   psql -f queries.sql

Ensure PostgreSQL is installed and the `psql` CLI is available.

## 💻 GitHub Repository

https://github.com/giannis07/fcc-worldcup-db
