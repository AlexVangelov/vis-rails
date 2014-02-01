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
  
  spec.add_dependency "momentjs-rails"
  spec.add_dependency "hammerjs-rails"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  # get an array of submodule dirs by executing 'pwd' inside each submodule
  `git submodule --quiet foreach pwd`.split($\).each do |submodule_path|
    # for each submodule, change working directory to that submodule
    Dir.chdir(submodule_path) do
 
      # issue git ls-files in submodule's directory
      submodule_files = `git ls-files`.split($\)
 
      # prepend the submodule path to create absolute file paths
      submodule_files_fullpaths = submodule_files.map do |filename|
        "#{submodule_path}/#{filename}"
      end
 
      # remove leading path parts to get paths relative to the gem's root dir
      # (this assumes, that the gemspec resides in the gem's root dir)
      submodule_files_paths = submodule_files_fullpaths.map do |filename|
        filename.gsub "#{File.dirname(__FILE__)}/", ""
      end
 
      # add relative paths to gem.files
      spec.files += submodule_files_paths
    end
  end
end
