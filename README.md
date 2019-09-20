[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/aguasdearuanda/zelio.svg?branch=master)](https://travis-ci.org/aguasdearuanda/zelio)
[![Coverage Status](https://coveralls.io/repos/github/aguasdearuanda/zelio/badge.svg?branch=master)](https://coveralls.io/github/aguasdearuanda/zelio?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/36c92d1de2b023758c8f/maintainability)](https://codeclimate.com/github/aguasdearuanda/zelio/maintainability)
[![Known Vulnerabilities](https://snyk.io/test/github/aguasdearuanda/zelio/badge.svg)](https://snyk.io/test/github/aguasdearuanda/zelio)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

# Zelio Classroom Management

This is an open source project that aims to control classroom students attendance.

## Project

* First section (Done)
  - Admin Section
    - Create/Manage Student's profiles , Classes data (Eg.: attendance), Groups (Eg.: classes), Teachers' profiles, Justifications;
    - Add a possibility to remove a student from a group and keep it his/her history;
    - Registering students' absences;
    - Corner Case: If the student has been created a justification for a specific class and it was accepted by the administrator, his/her absence won't be taken into consideration on the total of absencess but it will be kept on the student's records an absence in class;
    - On the dashboard it's possible to see the total number of justifications, active students, groups, and absences;
    
  - Student Section
    - On the dasboard the student will be able see his/her justifications and no attendances;
    - Create/View the justifications;

* Second section (Work in progress)
  - It will be created a new applications using Flutter;
  - Create a payment module to Admin;
  PS, the payment will not be made through the application, the administrator will just update the payment status to paid.
  - Create a student calendar;
  - Check it out what we have been doing and what we still need to do in order to finish this section. https://github.com/aguasdearuanda/zelio/projects/1

* Third section
  - To discuss the e-learning process.

## Diagram

![image](https://user-images.githubusercontent.com/104600/64392807-d441e880-d024-11e9-80bc-410984139cef.png)


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
Create an issue/feature
Open a PR and please don't forget to create the specs. :)
```

## Author

* **Davi Thiesse - @davithss**

## Contributors

* **Breno Moura - @basmoura**

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
