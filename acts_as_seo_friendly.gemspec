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

  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 4.0.0"
  spec.add_dependency "activesupport", "~> 4.0.0"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "pg"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rspec"  
end
