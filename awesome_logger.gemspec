# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'awesome_logger/version'

Gem::Specification.new do |gem|
  gem.name          = "awesome_logger"
  gem.version       = AwesomeLogger::VERSION
  gem.authors       = ["Robin Liao"]
  gem.email         = ["randuin@gmail.com"]
  gem.description   = %q{Awesome logging}
  gem.summary       = %q{Awesome logging}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'json'
end
