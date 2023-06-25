# README

# Ruby version
  `3.2.0`
# Rails version
  `7.0.5`
# Requirements
  `git`, `docker`, `docker-compose`

# How to setup

  `Clone`

  * $ git clone https://github.com/sidneypikot2/good_night

  `Build docker containers`

  * $ docker compose build

  `Start docker containers`

  * $ docker compose up -d

  `Setup database`

  * $ docker compose exec web rake db:setup db:migrate

  `Check logs`

  * $ docker compose exec web tail -f log/development.log

  `Stop docker container`

  * $ docker compose down

  `Import Api Collection to Postman. Filename: `
   * goodnight.postman_collection.json
