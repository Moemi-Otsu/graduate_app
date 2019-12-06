source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Core
ruby '2.6.3'
gem 'rails', '~> 5.2.3'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'

# Backend
gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'uglifier', '>= 1.3.0'

# View/Front
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'enum_help'
gem 'carrierwave'
gem 'mini_magick'
# User管理
gem 'devise'
gem 'cancancan'
# 検索
gem 'ransack'
gem 'kaminari'
# seedデータ
gem 'faker'

group :development, :test do
  # バグfix系ツール
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  # RSpec rails consoleでも動作確認できるように、gemfileでは :testだけでなく :developmentにも定義
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'launchy'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
  # selenium-webdriverとchromedriver-helperのgemは実行時に警告が出る。
  # webdriversに統合されたので入れ替える。
  # gem 'selenium-webdriver'
  # gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
