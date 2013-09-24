source 'https://rubygems.org'

gemspec

group :development do
  rails_version = %w( >=\ 3.2.0 <\ 4.0 )

  # We need those for the testing application to run.
  gem 'actionmailer', *rails_version
  gem 'activerecord', *rails_version

  gem 'puma'

  # Only require this one explicitly.
  gem 'pry-rails', require: false

  platforms :jruby do
    gem 'activerecord-sqlite3-adapter'
    gem 'activerecord-jdbcsqlite3-adapter'
  end

  platforms :ruby do
    gem 'thin'
    gem 'sqlite3'
  end
end

group :test do
  gem 'rake'
  gem 'mocha', require: false
  gem 'simplecov', require: false
end
