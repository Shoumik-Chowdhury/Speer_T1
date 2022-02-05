# README

## Requirements

- ruby 3.0.0p0
- rails 7.0.1

## Setup

- clone this repository to local machine
- run `bundle install`
- configure database. Default set as postgreSQL. Enter credentials to .env file following .env.example.
- migrate databse cmd: `rails db:migrate`
- start server cmd: `rails server`

## Tests

- run all tests cmd: `bin/rails test`

## Making requests

- To register a user:

  - Send POST request to `/users` with form parameters user.name, user.email, user.password and user.password_confirmation. No user interface so use a tool like insomnia or other preferred method.

- To login:

  - Send POST request to `/login` with form parameters user.email, user.password.

- To logout:
  - Send GET request to `logout`.
