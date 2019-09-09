# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'aws-sdk', '~> 3'
gem 'aws-sdk-rails', '>= 2.1.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'coveralls', require: false
gem 'devise', '>= 4.6.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '>= 4.3.5'
gem 'paperclip'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rack', '>= 2.0.6'
gem 'rails', '>= 5.2.3'
gem 'rubocop-rails_config', '>= 0.6.2'
gem 'simple_form', '>= 4.1.0'
gem 'sprockets-rails', '>= 3.2.1'
gem 'travis'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'factory_bot_rails', '>= 5.0.2'
  gem 'faker'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'rspec_api_documentation'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.7.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.24.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper', '>= 2.1.1'
  gem 'rails-controller-testing', '>= 1.0.4'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
