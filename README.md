# Interviewed Dump Reader
This repository is to aid in navigating the data dumps provided by our off-boarding script.  

## Requirements
You will need to have `docker` and `docker-compose` available on your machine in order to use this system.  You can follow the instructions for installing docker by going to this URL: https://docs.docker.com/get-docker/

## Getting Started
1. Clone this repository: `git clone https://github.com/prehire/dump-reader.git`
2. Navigate to the `dump-reader` directory.  
3. In the `dumps` directory, place all of your pgsql data dumps that you would like to be loaded into the database.
 * Each database dump placed in the "dumps" folder will create a new PostgreSQL database in the postgresql docker container.
3. Issue `docker-compose up --build` and the stack will come up.  You may see some loading errors, this is OK.

## Using the built-in Web-Client
1. Navigate to https://localhost:8000 to see the phpPgAdmin page.
2. On the left navigation window click "PostgreSQL" under "Servers".
3. You will be asked to log-in.  
  * User: `postgres`
  * Password: `password`

## Using a Different Client
You can also connect using your own postgresql client or terminal using the following connection information:
* Host: localhost
* Port: 5432
* User: postgres
* Password: Password


## Re-loading Dumps
If you need to reload your data dumps, the easiest way is to clear the database file.  Seeing the following log means that the database is *not* being reloaded:
```
interviewed-db | PostgreSQL Database directory appears to contain a database; Skipping initialization
```

To solve this, in the project directory, issue the following and the database volume will be deleted and the initialization script will re-load any data in the `dumps` directory:
`docker-compose down --remove-orphans`

## Trouble-Shooting
1. You may see erorrs during the dump load process, but this is OK.
2. Ensure that ports 8000 and 5432 are free on your host machine.
  * `lsof -i <PORT>` can help determine this
3. Ensure that *ONLY* psql data dump files are in the dumps directory
