# _Volunteer Tracker_

#### By _**Gabe Nielsen**_

#### _This application allows a user to make a list of projects, and add volunteers to those projects_

## Technologies Used

- _Ruby 2.6.10_
- _SQL_
- _Sinatra_
- _Capybara_
- _rspec_
- _pry_
- _zsh_

## Description

_When you open this application on your web browser, there is not much information to start with. That is because there are no projects currently stored. If you add a new projects, it will show up in the current projects list. You can then click on the projects to assign volunteers to it. Each project and volunteer can be edited or deleted._

## Setup/Installation Requirements

- _Clone this repository_
- _Make sure that your Ruby version is 2.6.X_
- _Navigate to the root directory in the terminal_
- _Run `createdb volunteer_tracker`_
- _Run `psql volunteer_tracker < database_backup.sql`_
- _Run `createdb -T volunteer_tracker volunteer_tracker_test`_
- _Run `bundle install` to install the necessary gems_
- _If you would like to see the test results, run `rspec`_
- _Run `ruby app.rb`_
- _In your web browser of choice, enter `localhost:4567`_

## Known Bugs

- _None that I know of as of this commit_

## License

Copyright (c) _2022_ _Gabe Nielsen_
