# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_seo_friendly/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_seo_friendly"
  spec.version       = ActsAsSeoFriendly::VERSION
  spec.authors       = ["Brooks Robertson"]
  spec.email         = ["brobertson@everydayhealthinc.com"]
  spec.description   = %q{provides a seo friendly version of record id}
  spec.summary       = %q{provides a seo friendly version of record id}
  spec.homepage      = "http://github.com/brooksjbr/acts_as_seo_friendly"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.0.0"

  spec.add_development_dependency "sqlite3"
  
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
end
