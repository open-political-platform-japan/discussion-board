source 'https://rubygems.org'

ruby "2.0.0"
gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3'
end

gem 'jquery-rails'

gem "exception_notification"
gem 'configurable_engine', github: "kuboon/configurable_engine"
gem "haml-rails"
gem "simple_form"
gem "kaminari"
gem "action_args"
gem "strong_parameters"
gem "factory_girl_rails"
gem "cancan", :git => "git://github.com/ryanb/cancan.git", :branch => "2.0"
gem 'acts_as_votable'
gem "acts-as-taggable-on"
gem "sorcery"
gem 'therubyracer'
gem "less-rails"
gem "twitter-bootstrap-rails"
gem "jquery-ui-rails"
gem "ransack"

group :development do
  gem "better_errors"
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails"
  gem "webrat"
  gem "pry-rails"
  gem 'spring'
end

group :heroku, :production do
  gem 'pg'
end