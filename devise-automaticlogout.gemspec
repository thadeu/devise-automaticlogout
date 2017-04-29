$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise/automaticlogout/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise-automaticlogout"
  s.version     = Devise::Automaticlogout::VERSION
  s.authors     = ["Thadeu Esteves Jr"]
  s.email       = ["tadeuu@gmail.com"]
  s.homepage      = "https://github.com/Thadeu/devise-automaticlogout"
  s.summary       = %q{Provides automatic session timeout in a Rails Devise application.}
  s.description   = %q{Provides automatic session timeout in a Rails Devise application.}
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails', '>= 4'
  s.add_dependency 'devise'

  s.add_development_dependency 'rubocop'
  s.add_development_dependency "sqlite3"
end
