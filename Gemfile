source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1'
gem 'sprockets-rails'
gem 'puma', '>= 5.0'
gem 'jsbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[ windows jruby ]
gem 'bootsnap', require: false
gem "stackprof"
gem "sentry-ruby"
gem "sentry-rails"
gem 'simple_form'
gem 'slim-rails'

group :development, :test, :production do
  gem 'pg', '~> 1.4'
end

group :development, :test do
  gem 'debug', platforms: %i[ mri windows ]
  gem 'faker'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'slim_lint'
end
group :development do
  gem 'web-console'
  gem 'html2slim'
  gem 'i18n-debug'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'minitest-power_assert'
end
