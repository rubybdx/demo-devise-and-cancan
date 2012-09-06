## Getting Started

1. `rails new app --skip-bundle`

2. Add to your Gemfile :

  ```ruby
  gem 'devise'
  gem 'cancan'
  gem 'rabl'
  ```

3. `bundle install`

4. `rails g devise:install`


5. `rails g devise User`

6. In the migration and the model, uncomment the lines linked to `token_authenticatable`

7. To ensure creation of the auth token, you need to add to the User model:

  ```ruby
  before_create :reset_authentication_token
  ```



## How to test the API

All you need is...

1. a running server: `rails s`
2. a ruby console: `ìrb`

then, you can play from the console:

  ```ruby
  > require './client.rb'
  => true

  > Client.post 'http://localhost:3000/users/sign_in', user: { email: "", password: "" }
  => 401 Unauthorized: {"error":"You need to sign in or sign up before continuing."}

  > Client.post 'http://localhost:3000/users', user: { email: "foo@example.com", password: "rubybdx" }
  => 422 Unprocessable Entity: {"errors":{"nickname":["can't be blank"]}}
  ```