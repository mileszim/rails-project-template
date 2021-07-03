source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

##
# Core
#
gem 'ahoy_matey'
gem 'aws-sdk-s3'
# gem 'bcrypt',                '~> 3.1.7'
gem 'blind_index'                                                                        # https://github.com/ankane/blind_index
gem 'bootstrap',             '~> 5'
gem 'bootsnap',              '>= 1.4.4', require: false                                  # Reduces boot times through caching; required in config/boot.rb
gem 'dotenv-rails',                      require: 'dotenv/rails-now'
gem 'flipper'
gem 'flipper-active_record'
gem 'flipper-ui'
gem 'hiredis'
gem 'image_processing',      '~> 1.2'                                                    # Use Active Storage variant
gem 'lockbox'
gem 'okcomputer'                                                                         # Health checks
gem 'paper_trail'
gem 'phonelib'
gem 'pg',                    '~> 1.1'                                                    # Use postgresql as the database for Active Record
gem 'puma',                  '~> 5.0'                                                    # Use Puma as the app server
gem 'pundit'
gem 'rack-cors'
gem 'rails',                 '~> 6.1.4'
gem 'rbnacl'
gem 'redis',                 '~> 4.0',   require: ['redis', 'redis/connection/hiredis']
gem 'redis-session-store'
gem 'sass-rails',            '>= 6'                                                      # Use SCSS for stylesheets
gem 'sentry-ruby'
gem 'sentry-rails'
gem 'sentry-sidekiq'
gem 'sidekiq',               '>= 6.1'
gem 'sorcery'
gem 'stimulus_reflex'
gem 'strong_migrations'
gem 'turbolinks',            '~> 5'                                                      # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]                       # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'view_component',                    require: 'view_component/engine'
gem 'view_component_reflex'
gem 'webpacker',             '~> 5.0'                                                    # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker


##
# Dev & Test
#
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'factory_bot_rails'
  gem 'faker'                                         # Generate fake data
  gem 'ngrok-tunnel'
  gem 'pry'
end

group :development do
  gem 'annotate'
  gem 'foreman'
  gem 'letter_opener'
  gem 'listen',        '~> 3.3'
  gem 'rspec-rails',   '~> 5.0.0'
  gem 'rubocop-rails',             require: false
  # gem 'rack-mini-profiler', '~> 2.0'   # Display performance information such as SQL time and flame graphs for each request in your browser. https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'web-console',   '>= 4.1.0' # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
end

group :test do
  gem 'capybara',          '>= 3.26' # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  gem 'webdrivers'                   # Easy installation and use of web drivers to run system tests with browsers
end
