#Cleanup:
docker-compose stop
docker-compose rm -v -f
docker volume rm dumpreader_pgadmin
docker volume rm dumpreader_postgres