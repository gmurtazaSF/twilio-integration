Things you may want to cover:

- Ruby version

  - ruby 3.0.0

- System dependencies

  Before you get started, the following needs to be installed:

  - Ruby 3.0.0 (bundler v2)
  - Rails 7.0.8
  - PostgreSQL 14.10
  - node 16.13.0
  - npm 8.1.4
  - Application Server: Puma

- Configuration

  ### Setting up the development environment

  1.  Install the required gems by running the following command in the project root directory:

  ```bash
  bundle install
  ```

  2.  Install the required packages by running the following command in the project root directory:

  ```bash
  npm install
  yarn
  ```

  3.  Create an `application.yml` file by copying the example database configuration:

  ```bash
  touch config/application.yml
  ```

  4.  Set your twilio credentials in `application.yml` file

  Example Credentials:

  - TWILIO_ACCOUNT_SID: 'Twilio Account SID'
  - TWILIO_AUTH_TOKEN: 'AUTH Token'
  - TWILIO_PHONE_NUMBER: 'Twilio Generated Phone Number'

- Create database using:

  ```bash
  rails db:create db:migrate
  ```

- Run server:

  ```bash
  rails server or rails s
  ```
