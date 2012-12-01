source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem "rails-backbone"

gem 'yelpster'

gem 'newrelic_rpm'

gem 'pg'
gem 'apartment'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'silent-postgres'
  gem 'quiet_assets'
  gem 'thin'
  gem 'heroku'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'database_cleaner'
end

group :production do
  gem 'unicorn'
end
