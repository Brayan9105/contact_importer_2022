# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |_repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'active_storage_validations', '~> 1.0', '>= 1.0.3'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'credit_card_validations'
gem 'devise'
gem 'dotenv-rails'
gem 'importmap-rails'
gem 'pagy', '~> 5.10'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidekiq-scheduler'
gem 'sidekiq-throttled'
gem 'sidekiq-unique-jobs'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'awesome_print', '~> 1.9', '>= 1.9.2', require: 'ap'
  gem 'capybara'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker'
  gem 'pry-byebug', '~> 3.8'                      # Combine 'pry' with 'byebug'
  gem 'pry-rails', '~> 0.3.9'                     # Debugging console
  gem 'pry-remote', '~> 0.1.8'                    # Connect to Pry remotely
  gem 'rspec', '~> 3.11'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'rubocop', '~> 1.6', '>= 1.6.1', require: false
  gem 'rubocop-gitlab-security', '~> 0.1.1'
  gem 'rubocop-performance', '~> 1.14', '>= 1.14.3', require: false
  gem 'rubocop-rails', '~> 2.15', '>= 2.15.2', require: false
  gem 'rubocop-rspec', '~> 2.12', '>= 2.12.1', require: false
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'brakeman', '~> 5.2', '>= 5.2.3'
  gem 'bullet', '~> 7.0', '>= 7.0.2'
  gem 'bundler-audit', '~> 0.9.1'
  gem 'database_consistency', '~> 1.1', '>= 1.1.15'
  gem 'fasterer', '~> 0.10.0'
  gem 'overcommit', '~> 0.59.1'
  gem 'rails_best_practices', '~> 1.23', '>= 1.23.1'
  gem 'reek', '~> 6.1', '>= 6.1.1'
  gem 'sql_queries_count', '~> 0.0.1'
  gem 'web-console'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-sidekiq', '~> 3.1'
  gem 'shoulda-callback-matchers', '~> 1.1', '>= 1.1.4'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21.2'
  gem 'timecop', '~> 0.9.5'
end
