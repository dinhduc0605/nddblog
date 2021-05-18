# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'
# Use Puma as the app server
gem 'puma', '~> 5.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave', '~> 1.0'
gem 'coderay'
gem 'devise', '~> 4.7.1'
gem 'figaro'
gem 'fog-aws'
gem 'friendly_id', '~> 5.1.0'
gem 'http_accept_language'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'pg', '~> 1.1.3'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'redcarpet'
gem 'somemoji'
gem 'slack-ruby-client'
gem 'webpacker', '~> 4.x'
gem 'ed25519', '~> 1.2'
gem 'bcrypt_pbkdf', '~> 1'
gem 'kaminari'
gem 'foreman'
gem 'rollbar'

# for railties app_generator_test
gem 'bootsnap', '>= 1.1.0', require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 4.0.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-figaro-yml', '~> 1.0.2'
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-puma', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  # Rubocop check
  gem 'checkstyle_filter-git'
  gem 'rubocop', '~> 0.61.1', require: false
  gem 'rubocop-checkstyle_formatter', '~> 0.2.0'
  gem 'rubocop-select', '~> 1.0.0'
  gem 'saddler', '~> 1.0.0'
  gem 'saddler-reporter-github', '~> 1.0.0'

  # Rspec test
  gem 'rspec_junit_formatter'

  gem 'pry-rails'
  gem 'pry-byebug'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
