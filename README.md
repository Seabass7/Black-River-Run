# Black-River-Run
Timekeeping system for Black River Run

## Installation
- Create a database
- Import the file "BlackRiverRunDatabaseStructure.sql" to the database
- Change the values in "database.php" to match your database connection
- Copy all files (except BlackRiverRunDatabaseStructure.sql) to the target server

## Configuration
- Insert a new value in the database table "administrator" where password is a password encrypted with bcrypt.
- Then you can access the control panel by visiting the page index.php?page=login and log in.
