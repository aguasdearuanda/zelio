# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'aws-sdk-s3', '~> 1'
gem 'barnes'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bugsnag', '~> 6.12'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'coveralls', '>= 0.8.23', require: false
gem 'devise', '>= 4.7.1'
gem 'jbuilder', '~> 2.9', '>= 2.9.1'
gem 'jquery-rails', '>= 4.3.5'
gem 'paperclip', '>= 6.1.0'
gem 'pg'
gem 'puma', '~> 3.12', '>= 3.12.4'
gem 'rack', '>= 2.0.8'
gem 'rails', '>= 6.0.3.1'
gem 'recaptcha', '>= 5.1.0'
gem 'rubocop-rails_config', '>= 0.10.0'
gem 'simple_form', '>= 5.0.2'
gem 'sprockets-rails', '>= 3.2.1'
gem 'travis', '>= 1.8.10'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'factory_bot_rails', '>= 5.1.1'
  gem 'faker'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rails-erd', '>= 1.6.0'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.3'
  gem 'rspec_api_documentation', '>= 6.1.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 4.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.29.0'
  gem 'selenium-webdriver', '>= 3.142.3'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper', '>= 2.1.1'
  gem 'rails-controller-testing', '>= 1.0.4'
  gem 'shoulda-matchers', '>= 4.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
