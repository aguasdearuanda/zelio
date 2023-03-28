# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'
gem 'aws-sdk-s3', '~> 1'
gem 'barnes'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bugsnag', '~> 6.12'
gem 'coffee-rails', '~> 5.0', '>= 5.0.0'
gem 'coveralls', '>= 0.8.23', require: false
gem 'devise', '>= 4.8.0'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails', '>= 4.4.0'
gem 'paperclip', '>= 6.1.0'
gem 'pg'
gem 'puma', '~> 4.3', '>= 4.3.11'
gem 'rack', '>= 2.0.8'
gem 'rails', '>= 7.0.4.3'
gem 'recaptcha', '>= 5.1.0'
gem 'rubocop-rails_config', '>= 1.7.5'
gem 'simple_form', '>= 5.1.0'
gem 'sprockets-rails', '>= 3.4.2'
gem 'travis', '>= 1.8.10'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'factory_bot_rails', '>= 6.2.0'
  gem 'faker'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rails-erd', '>= 1.6.0'
  gem 'rspec-rails', '~> 4.1.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 4.2.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.31.0'
  gem 'selenium-webdriver', '>= 3.142.3'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers', '~> 3.9', '>= 3.9.4'
  gem 'rails-controller-testing', '>= 1.0.5'
  gem 'shoulda-matchers', '>= 4.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
