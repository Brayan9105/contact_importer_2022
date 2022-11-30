# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.1.2'

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
end

group :development do
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
