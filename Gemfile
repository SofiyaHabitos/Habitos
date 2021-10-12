source 'https://rubygems.org'
#test line for reference
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
gem 'execjs'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 5.5'
gem "responders"
gem "active_model_serializers"#, github: "rails-api/active_model_serializers"
gem 'date_validator'
gem 'carrierwave', '~> 1.0'
gem 'bootstrap', '~> 4.2.1'
# Use SCSS for stylesheets
gem 'grim'
gem 'prawn'
gem 'prawn-table', '~> 0.1.0'
gem 'rmagick'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.7'
#gem 'sass-rails', '>= 3.2'  
gem 'font-awesome-sass', '~> 4.7.0'
gem 'will_paginate', '3.1.5'
gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
gem "select2-rails"
gem 'bootstrap-datepicker-rails'
# gem 'momentjs-rails', '>= 2.9.0'
# gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem "nested_form"
gem 'client_side_validations'
gem 'whenever', :require => false
gem "gritter", "1.2.0"
#gem 'bcrypt'
gem 'seed_dump'
gem 'paranoia'
gem 'axlsx_rails'
gem "roo"
gem 'spreadsheet'
gem 'zip-zip'
gem 'rest-client', '~> 1.8'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'rubyzip'
gem 'zip-zip'
gem 'mini_magick'
#gem 'rmagick'
#gem 'fog', require: 'fog/aws'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'imgkit'
gem 'wkhtmltoimage-binary'
# Use jquery as the JavaScript library
#gem 'jquery-rails', '~> 4.3.3'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
#gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
