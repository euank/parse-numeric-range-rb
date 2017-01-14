# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parse_numeric_range'

Gem::Specification.new do |spec|
  spec.name          = "parse-numeric-range"
  spec.version       = ParseNumericRange::VERSION
  spec.authors       = ["Euan Kemp"]
  spec.email         = ["euank@euank.com"]

  spec.summary       = %q{Simple gem to parse numeric ranges}
  spec.homepage      = "https://github.com/euank/parse-numeric-range-rb"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
