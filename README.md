# README

This README provides instructions for getting the application up and running.

## Ruby version
This application requires Ruby version 3.1.3. If you don't have Ruby installed, you can download it from [the official Ruby website](https://www.ruby-lang.org/en/downloads/).

## System dependencies
There are no additional system dependencies required to run this application.

## Configuration
No additional configuration is needed for this application.

## Database creation
This application uses PostgreSQL as its database. Before running the application, make sure PostgreSQL is installed on your system. You can download PostgreSQL from [the official PostgreSQL website](https://www.postgresql.org/download/).

To create the database, run the following command in your terminal:
```rails db:create```

This command will create the necessary database specified in the `config/database.yml` file.

## Database initialization
If your application requires any initial data to be seeded into the database, you can run:

```rails db:migrate```

This command will run any pending migrations and set up the database schema. You can also run:

```rails db:seed```

to seed the database with initial data defined in the `db/seeds.rb` file.

## How to run the test suite
This application uses RSpec as its testing framework. To run the test suite, simply execute:

```bundle exec rspec```

This command will run all the tests located in the `spec` directory.

## Services
This application does not currently utilize any external services.
