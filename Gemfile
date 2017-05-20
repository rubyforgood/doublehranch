source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0'
ruby '2.4.1'

gem 'acts-as-taggable-on', :git => 'https://github.com/mbleigh/acts-as-taggable-on'
gem 'acts_as_commentable'
gem 'aws-sdk'
gem 'coffee-rails'
gem 'country_select'
gem 'devise'
gem 'erubis'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'paperclip', '~> 5.0.0'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.7'
gem 'pundit'
gem 'rails4-autocomplete'
gem 'rails_admin', '~> 1.1.1'
gem 'rails_admin_pundit', :github => 'sudosu/rails_admin_pundit'
gem 'remote_table', '~> 3.3.3'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 3.5'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :test do
  gem 'rake'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
