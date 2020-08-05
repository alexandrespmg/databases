# Flyway

Flywayis a migration tool that makes easier to manage migrations. Look at [official website](https://flywaydb.org/).

## Sql-server example

It could be pain to manage migrations from Entities Frameworks.

This examples shows an alternative to manage locally and at Continuous Deployment, adding a stage of migration that will be showed here.

Also, it is not mandatory to install the SQL server locally, thanks to docker.



## How To Use

To use this, only will be necessary `docker` and `docker-compose`.

| Command                              | What do                             | Context to run |
|--------------------------------------|-------------------------------------|----------------|
| `docker-compose up`                  | Setup database and apply migrations | `/`            |
| `docker build -t flyway-migration .` | Build docker container and tag name | `db/`          |
| `docker run flyway-migration`        | Run container with default envs     | Any            |


To develop `locally` only `docker-compose up` is necessary.

To apply migration to a server, it recommand to use the docker build, and run it with `.env` or applying the correct values.

For example:

```console
user~/db$ docker build -t flyway-migration .

Sending build context to Docker daemon  5.632kB
Step 1/7 : FROM flyway/flyway:6.5.1
 ---> 50803de2ac1a
Step 2/7 : ENV server=db
 ---> Running in 75704d257a31
Removing intermediate container 75704d257a31
 ---> 30e3cc3da961
Step 3/7 : ENV schemas=my_schema
 ---> Running in 0af18988fae3
Removing intermediate container 0af18988fae3
 ---> 19b0a57c7f8f
Step 4/7 : ENV user=sa
 ---> Running in 29ccc2b1f65a
Removing intermediate container 29ccc2b1f65a
 ---> cb02d7b62d83
Step 5/7 : ENV password=Your_password123
 ---> Running in 9e1245d9b777
Removing intermediate container 9e1245d9b777
 ---> 013bdccdf979
Step 6/7 : ENV command=migrate
 ---> Running in 38a4b0c974ff
Removing intermediate container 38a4b0c974ff
 ---> 377584fedd5a
Step 7/7 : ENTRYPOINT flyway -url=jdbc:sqlserver://${server} -schemas=${schemas} -user=${user} -password=${password} -connectRetries=60 ${command}
 ---> Running in 99553731ac2f
Removing intermediate container 99553731ac2f
 ---> 5fb1a3762dd8
Successfully built 5fb1a3762dd8
Successfully tagged flyway-migration:latest

user~/db$ docker run  -e server=db -e schemas=my_schema -e user=sa -e password=Your_password123 -e command=migrate flyway-migration
```

If you try to migrate from docker to your containered sql-server, remind to add the --network=sql-server-example_default at docker run. Or the network of container (`docker network ls` shows it)


### Migrations

The sqls' files should be placed at `db/migration` using [this naming convention](https://flywaydb.org/documentation/migrations#naming).

### Seed

You could add seed inserts to run when you setup your local project. Just place it at `afterMigrate.sql` like the example.

## License
[MIT](https://choosealicense.com/licenses/mit/)