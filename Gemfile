# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.1.3'

gem 'rails', '~> 7.0.4'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"


group :development, :test do
  # indented print of Ruby and Rails Objs and Arrays by using `ap something
  gem 'awesome_print', '~> 1.9', '>= 1.9.2', require: 'ap'
  gem 'rspec', '~> 3.11'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  # Rspec DSL that generates Swagger files directly from your rspecs
  gem 'rswag-specs', '~> 2.5', '>= 2.5.1'
  gem 'rubocop', '~> 1.6', '>= 1.6.1', require: false
  gem 'rubocop-gitlab-security', '~> 0.1.1'
  gem 'rubocop-performance', '~> 1.14', '>= 1.14.3', require: false
  gem 'rubocop-rails', '~> 2.15', '>= 2.15.2', require: false
  gem 'rubocop-rspec', '~> 2.12', '>= 2.12.1', require: false
  gem 'pry-byebug', '~> 3.8'                      # Combine 'pry' with 'byebug'
  gem 'pry-rails', '~> 0.3.9'                     # Debugging console
  gem 'pry-remote', '~> 0.1.8'                    # Connect to Pry remotely
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  # gem "rack-mini-profiler"
  gem 'annotate', '~> 3.2'
  # Provides a better error page for Rails and other Rack apps
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  # Static analysis tool for security vulnerabilities.
  gem 'brakeman', '~> 5.2', '>= 5.2.3'
  # bundler-audit provides patch-level verification for Bundled apps.
  gem 'bundler-audit', '~> 0.9.1'
  # Increase your application's performance by reducing the number of queries it makes.
  gem 'bullet', '~> 7.0', '>= 7.0.2'
  # Checks the consistency of the database constraints with the application validations
  gem 'database_consistency', '~> 1.1', '>= 1.1.15'
  # Check various places in your code that could be faster.
  gem 'fasterer', '~> 0.10.0'
  # Utility to install, configure, and extend Git hooks
  gem 'overcommit', '~> 0.59.1'
  # Code metric tool to check the quality of Rails code.
  gem 'rails_best_practices', '~> 1.23', '>= 1.23.1'
  # Tool that examines classes, modules and methods and reports any Code Smells it finds.
  gem 'reek', '~> 6.1', '>= 6.1.1'
  # Adds number of SQL queries that were done during processing request
  # TODO: Enable this gem once the rails app is set, one of its dependancies is the Rails gem
  # gem 'sql_queries_count', '~> 0.0.1'
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Simple testing of Sidekiq jobs via a collection of matchers and helpers
  # gem 'rspec-sidekiq', '~> 3.1'
  # Fake (In-memory) driver for redis-rb
  # gem 'fakeredis', '~> 0.5.0'
  gem 'shoulda-callback-matchers', '~> 1.1', '>= 1.1.4'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21.2'
  gem 'timecop', '~> 0.9.5'

end
