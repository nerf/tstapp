require 'active_support/core_ext/module/delegation'
require './app/uploaders/passport_uploader'

# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

# load yml config file
config_file = File.expand_path('../config.yml', __FILE__)
if File.file?(config_file)
  config = YAML.load(File.read(config_file))
  config.merge! config.fetch(PADRINO_ENV, {})
  config.each do |key,value|
    ENV[key] = value.to_s
  end
end

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  # Padrino.dependency_paths << Padrino.root('app/uploaders/*')

  Rabl.configure do |config|
    config.include_json_root = false
    config.include_child_root = false
  end

  Rabl.register!
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!
