[![Build Status](https://travis-ci.org/aguasdearuanda/zelio.svg?branch=master)](https://travis-ci.org/aguasdearuanda/zelio)
[![Coverage Status](https://coveralls.io/repos/github/aguasdearuanda/zelio/badge.svg)](https://coveralls.io/github/aguasdearuanda/zelio)
[![Maintainability](https://api.codeclimate.com/v1/badges/36c92d1de2b023758c8f/maintainability)](https://codeclimate.com/github/aguasdearuanda/zelio/maintainability)
[![Known Vulnerabilities](https://snyk.io/test/github/aguasdearuanda/zelio/badge.svg?targetFile=Gemfile.lock)](https://snyk.io/test/github/aguasdearuanda/zelio)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

# Zelio Classroom Management

This is a volunteer project to https://www.aguasdearuanda.org.br/ that will control classroom students attendance.

## Project

* First section (Work in progress)
  - Check it out what we have been doing and what we still need to do in order to finish this section. https://github.com/aguasdearuanda/zelio/projects/1

* Second section
  - Discuss the purpose of creating a hybrid mobile app
  - Create a Student session to see their attendance's history and payment as well.
  PS, the payment will not be made through the application, the administrator will just update the payment status to paid.

* Third section
  - To discuss the e-learning process.

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
Rspec
```

## Contributing
```
Create an issue/feature
Open a PR :)
```

## Author

* **Davi Thiesse**
