# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vis/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "vis-rails"
  spec.version       = Vis::Rails::VERSION
  spec.authors       = ["AlexVangelov"]
  spec.email         = ["email@data.bg"]
  spec.description   = %q{This gem provides Rails driver for http://visjs.org browser-based visualization library}
  spec.summary       = %q{Using http://visjs.org visualization library with Rails}
  spec.homepage      = "https://github.com/AlexVangelov/vis-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
