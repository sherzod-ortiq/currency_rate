# Currency rate

## Description
Currency rate app built with Ruby and Ruby on Rails.<br>
It broadcasts updates of currency rate USD to RUB every minute.<br>
It uses a React.js package for picking date and time and it has accuracy issue.
So you may need to pick greater date if you want the fixed rate to be shown.
App consists of 4 Docker containers: 1 - rails app, 2 - sidekiq worker,<br>
3 - redis database, 4 - postgres database. <br>
The volume binding is used in development to map container files and folders to host machine.<br>
Volume binding makes it possible to exclude files from mapping.<br>
There are separate Docker and Docker compose files for development and test environments.<br>

## Tech stack
Docker<br>
Docker compose<br>
Ruby<br>
Ruby on Rails<br>
Sidekiq<br>
Postgres<br>
Redis<br>

## How to make it work

**For development environment:**<br>
cd to project root folder.<br>
We have 4 containers in development environment.<br>
Create images + create and run containers:<br>
`docker-compose -f ./docker-compose-dev.yml up`<br>
Stop and remove containers:<br>
`docker-compose -f ./docker-compose-dev.yml down`<br>
Rebuild images + create and run containers:<br>
`docker-compose -f ./docker-compose-dev.yml up --build`<br>
List services:<br>
`docker-compose -f ./docker-compose-dev.yml ps`<br>
App runs on *localhost:3000*<br>
Sidekiq dashboard is on *localhost:3000/sidekiq/*<br><br>

**For test environment:**<br>
cd to project root folder.<br>
We have 4 containers in test environment.<br>
Create images + create and run containers:<br>
`docker-compose -f ./docker-compose-test.yml up`<br>
Stop and remove containers:<br>
`docker-compose -f ./docker-compose-test.yml down`<br>
Rebuild images + create and run containers:<br>
`docker-compose -f ./docker-compose-test.yml up --build`<br>
List services:<br>
`docker-compose -f ./docker-compose-test.yml ps`<br>
Container where tests are run may need to restart few times<br>
in order to connect to postgres.<br>
Don't forget to stop all the services after running tests.<br><br>
