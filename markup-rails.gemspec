# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "markup/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "markup-rails"
  s.version     = Markup::Rails::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.summary     = "Markup support for rails/active record."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "rao-view_helper"
  s.add_dependency "kramdown"

  s.add_development_dependency "RedCloth"
  s.add_development_dependency "pandoc-ruby"
  s.add_development_dependency "sqlite3", "~> 1.3.6"
  s.add_development_dependency "capybara"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'git_log_generator'
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency "simplecov"
end
