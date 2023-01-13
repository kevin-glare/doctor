source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sass-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "activeadmin"
gem "activeadmin_addons"
gem "devise"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
end

group :development do
  gem "web-console"
  gem "bullet"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
