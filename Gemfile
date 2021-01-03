source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use SCSS for stylesheets
gem 'sassc'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'active_model_serializers', '~> 0.10.0'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Image Processing / File Uploads / ActiveStorage
gem "active_storage_validations"
gem "aws-sdk-s3"
gem 'mini_magick'
gem "image_processing"
gem "figaro"
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'

# Use sidekiq for background job processing
gem 'sidekiq'

# PayPal SDK
gem 'paypal-sdk-rest'
gem 'paypal-checkout-sdk'

# HTTParty for http requests
gem 'httparty'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'rack-reducer', require: 'rack/reducer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'better_errors'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara', '~> 2.5'
  gem "rubocop", "0.72.0"
  gem "rubocop-performance"
  gem "rubocop-rails", "~> 2.5.2"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use Capistrano for deployment
  gem "capistrano", "~> 3.10"
  gem "capistrano-rails", "~> 1.3"
  gem "capistrano-passenger"
  gem "capistrano-rvm"
  gem 'annotate'
end

group :test do
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'database_cleaner', '~> 1.5'
  gem 'faker', '~> 1.6.1'
end
