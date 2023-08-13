# Planner

This is a task planner that helps you organize your personal and professional projects. You can create tasks, assign them to different categories. Built on Ruby on Rails, also uses PostgreSQL as the database system, Bootstrap as the front-end framework.
This app designed to be user-friendly, responsive, and secure. You can access the website from any device and browser. You can also sign up with your email. Whether you need to manage your daily tasks, plan a trip, or work on a big project, this app is the perfect solution for you.

## Deploy with Docker
Сlone this repository with the following command in the terminal.
```bash
git clone https://github.com/trufanovnik/trainee-planner.git
```
Use [Docker](https://www.docker.com/) commands to deploy the application.

```bash
# create a docker image
docker-compose build
# start the container
docker-compose run
```
In a separate terminal, run the following commands to create and configure the database.

```bash
# create database
docker compose run web rake db:create
# run migrations
docker compose run web rake db:migrate
# fill the database
docker compose run web rake db:seed
```
Also you can run tests to check if it works.
```bash
docker compose run web bundle exec rspec
```
## Run application locally

To run the application locally you will need [ruby](https://www.ruby-lang.org) version 3.1.4 and [postgres](https://www.postgresql.org/) version 14.

First, install the necessary gems using the following command.
```bash
bundle install
```
Next you need to create and configure the database.

```bash
# create database
bin/rails db:create
# run migrations
bin/rails db:migrate
# fill the database
bin/rails db:seed
```
Now you can start the server with next command and use the app locally.
```bash
# run rails app
bin/rails server
```
Also you can run tests to check if it works.
```bash
# run rspec tests
bundle exec rspec
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)