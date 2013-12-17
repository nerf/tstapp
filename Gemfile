source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
gem 'oj'

# JSON builder
gem 'rabl'

# Project requirements
gem 'rake'

# Component requirements
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'sqlite3'

# Test requirements
group :test, :development do
  gem 'rspec'
end

group :test do
  gem 'rack-test', :require => 'rack/test'
  gem 'shoulda-matchers'
  gem 'factory_girl'
  gem 'database_cleaner'
end

# Padrino Stable Gem
gem 'padrino', '0.11.4'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.4'
# end
