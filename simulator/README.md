# Simulator
The simulator adds runners to the database and makes them run a specified race. During the race there are a few errors that occur.
When the simulator is accessed, it returns punches for one hour of the race in the same way the live API does.

## Configuration
- Update "$num_runners" in "index.php" to match the number of runners wanted in the test.
- Update "$this->race_instance" value in "runner.class.php", function "__contruct" (default: '1000'.($gender+1).$distance)
- Update "race" value in "runner.class.php", function "getSiUnit" (default: 1000)
- Update "race" value in "runner.class.php", function "getRunner" (default: 1000)

## Build
- Run "index.php?build"

## Clear data
- Run "index.php?clear"

## Running
- Access "test/?unitId=UNIT_ID&lastId=LAST_ID&date=DATE&time=TIME" where
  - UNIT_ID is the unit code to the station
  - LAST_ID is the last fetched ID from the specified station
  - DATE is the date to fetch
  - TIME is the time to fetch
