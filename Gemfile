# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'brakeman'
gem 'bundle-audit'
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'simple_form'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'stackprof'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test, :production do
  gem 'pg', '~> 1.4'
end

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'faker'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'slim_lint'
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
