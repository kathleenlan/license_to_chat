# encoding: utf-8
# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 4.2.6'
gem 'pg', '~> 0.18.4'

gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '~> 4.0.5'
gem 'kaminari', '~> 0.16.3'
gem 'ransack'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'semantic-ui-sass', '~> 2.1.8.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

group :development, :test do
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'spring'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capistrano', '~> 3.5.0'
  gem 'capistrano-rails', '~> 1.1.6'
end

group :production do
  gem 'puma', '~> 3.4.0'
end
