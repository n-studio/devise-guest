$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise-guest/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise-guest"
  s.version     = DeviseGuest::VERSION
  s.authors     = ["Matthew Nguyen"]
  s.email       = ["contact[]n-studio.fr"]
  s.homepage    = nil
  s.summary     = "Guest with devise"
  s.description = "Let the user use your application without registration process."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.require_path = 'lib'

  s.add_dependency "rails", ">= 4.0.0"

  s.add_development_dependency "sqlite3"
end
