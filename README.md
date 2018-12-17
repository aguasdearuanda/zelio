# Zelio Classroom Management

This is a volunteer project to https://www.aguasdearuanda.org.br/ that will control classroom students attendance.

## Project

* First section (Work in progress)
  - ~~Setting up the frontend. (Done)~~
  - ~~Create a Administrator session (Done)~~
    - ~~CRUD and relationship between Students, Klasses, Teachers (Done)~~
    - ~~Make a way to control if the student is attending the classes. (Done)~~
    - Make a way just to say if the student paid on that month. (work in progress)
    - Create all the specs
    - Allow Administrator change the information about your profile(add photo as well).
* Second section
  - Create a Student session to see their attendance's history and payment as well.
  PS, the payment will not be made through the application, the administrator gonna mark as paid.

* Third section
  - To discuss about the e-learning.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Settings

```
git clone git@github.com:davithss/zelio.git
bundle install
rake db:create db:migrate
```
#### Create a Admin User
```
rails console
Admin.create!({email: 'your_email', password: 'password'})
```

## Running the tests

```
rspec
```

## Contributing
```
Create a issue/feature
Open a PR :)
```

## Author

* **Davi Thiesse**
