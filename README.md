== Getting Started

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
