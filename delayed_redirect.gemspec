# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'delayed_redirect/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'delayed_redirect'
  s.version     = DelayedRedirect::VERSION
  s.authors     = ['Jonathon Padfield']
  s.email       = ['jonathon.padfield@gmail.com']
  s.homepage    = 'https://github.com/trammel/delayed_redirect'
  s.summary     = 'Middleware for Rails that can redirect after the page is rendered.'
  s.description = 'Middleware ror Rails that can redirect after the page is rendered.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rake'
  s.add_dependency 'rack', '~> 2.0'
  s.add_dependency 'activesupport', '~> 5.0'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
