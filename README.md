# README

## Stripe Events Processor

This application is a simple Stripe events processor that listens for webhook events from Stripe and handles subscription-related events.

## Usage

- **Stripe Webhook Setup**: Configure your Stripe account to send webhook events to the endpoint provided by this application.
- **Installation**: Clone this repository and install dependencies by running `bundle install`.
- **Configuration**: Set up your Stripe API keys in the `.env` file.
- **Run the Application**: Start the Rails server using `rails server`.

## Future Enhancements
- **Authentication**: Add authentication logic to secure the application and associate subscriptions with users.
- **Plan Model**: Introduce a Plan model to manage different subscription plans and features.
- **Enhanced Subscription Model**: Expand the Subscription model to include additional attributes like plan_id, user_id, cancellation_date, etc.
- **Improved Error Handling**: Handle errors more robustly, including logging, notifying administrators, and providing user-friendly error messages.
- **Tests for Error Handling**: Add tests to ensure proper error handling and logging functionality.
- **Making use of Hotwire Technology**: Set up Turbo for better performance.

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
