# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'horse/version'

Gem::Specification.new do |spec|
  spec.name          = "horse"
  spec.version       = Horse::VERSION
  spec.authors       = ["delba"]
  spec.email         = ["delba@server.fake"]
  spec.description   = %q{Rack}
  spec.summary       = %q{Rack}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"

  spec.add_runtime_dependency 'rack'
  spec.add_runtime_dependency 'thin'
end
