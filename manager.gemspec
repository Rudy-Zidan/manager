$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "manager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "manager"
  s.version     = Manager::VERSION
  s.authors     = ["Rudy Zidan"]
  s.email       = ["rz.zidan@gmail.com"]
  s.homepage    = "https://github.com/Rudy-Zidan/manager"
  s.summary     = "Rails project manager controlling, searching and install gems, also show db migrations timeline which one has been executed and other migrations need to be executed."
  s.description = "Description of Manager."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"
  s.add_dependency 'haml-rails', '~> 0.9.0'

  s.add_development_dependency "sqlite3"
end
