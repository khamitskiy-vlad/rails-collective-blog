# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'ancestry'
gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3.3'
gem 'brakeman'
gem 'bundle-audit'
gem 'cssbundling-rails'
gem 'devise', '~> 4.9'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pagy', '~> 8.6'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1'
gem 'rails-i18n'
gem 'ransack'
gem 'rexml', '~> 3.3', '>= 3.3.3'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'simple_form'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'stackprof'
gem 'stimulus-rails'
gem 'turbo-rails', '~> 1.0.0'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :production do
  gem 'pg', '~> 1.4'
end

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'faker'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'slim_lint'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'html2slim'
  gem 'i18n-debug'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'minitest-power_assert'
  gem 'selenium-webdriver'
end
