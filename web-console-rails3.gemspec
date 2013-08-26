$:.push File.expand_path("../lib", __FILE__)

require "web_console/version"

Gem::Specification.new do |s|
  s.name     = "web-console-rails3"
  s.version  = WebConsole::VERSION
  s.authors  = ["Genadi Samokovarov", "Guillermo Iguaran"]
  s.email    = ["gsamokovarov@gmail.com", "guilleiguaran@gmail.com"]
  s.homepage = "https://github.com/gsamokovarov/web-console-rails3"
  s.summary  = "Rails Console on the Browser, Rails 3 edition."

  s.license = 'MIT'

  s.files      = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails",             ">= 3.2.0", "< 4.0"
  s.add_dependency "strong_parameters", "~> 0.2.0"
end
