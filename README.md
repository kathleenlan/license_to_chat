# license_to_chat

This application is a license plate-based message board platform where users can
post and view messages associated with a given vehicle license plate. Each
license plate in the system will have a newsfeed of comments written by users.
Users will also be able to subscribe to license plates to receive notifications
when a new comment is added.

The motivation behind this application is to provide a means for people to
communicate with other people about their vehicles (e.g. about maintenance
issues such as 'Your tire looks flat!' or 'Your tail light is broken!')
when direct communication is not possible (e.g. when the target vehicle is 
parked and the owner is not around or when the target vehicle is in motion).

## Database creation and configuration

This application uses PostgreSQL as the database.

To create the database, first setup a `database.yml` database configuration
file. You can copy the `config/database.yml.example` and modify the
configuration variables as appropriate.

In a terminal, run the following command in the project directory to create the
database:

```
bundle exec rake db:create 
```

Migrations can be run with the following command:

```
bundle exec rake db:migrate
```

## Running the test suite
