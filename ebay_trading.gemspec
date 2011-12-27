$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ebay_trading/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ebay_trading"
  s.version     = EbayTrading::VERSION
  s.authors     = ["Andrea Longhi"]
  s.email       = ["andrea@spaghetticode.it"]
  s.homepage    = "https://github.com/spaghetticode/ebay_trading"
  s.summary     = "rails 3 gem to access ebay trading api"
  s.description = "rails 3 gem to access ebay trading api"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.1.3'
  s.add_dependency 'nokogiri'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard-test'
  s.add_development_dependency 'mocha'
end
