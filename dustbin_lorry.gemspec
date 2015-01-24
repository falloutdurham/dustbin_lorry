# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dustbin_lorry/version'

Gem::Specification.new do |spec|
  spec.name          = "dustbin_lorry"
  spec.version       = DustbinLorry::VERSION
  spec.authors       = ["Ian Pointer"]
  spec.email         = ["ian@snappishproductions.com"]
  spec.summary       = %q{ Output method cache busts to logger }
  spec.description   = %q{ DustbinLorry is Rack middleware that inspects the method cache
                           before and after a request and will output to the logger if a change has occurred}
  spec.homepage      = "https://github.com/falloutdurham/dustbin_lorry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '=> 2.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "pry"
end
