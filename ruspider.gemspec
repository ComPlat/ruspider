# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruspider/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruspider'
  spec.version       = Ruspider::VERSION
  spec.authors       = ['An Nguyen']
  spec.email         = ['an.nguyen@kit.edu']

  spec.summary       = 'Ruby gem for ChemSpider'
  spec.description   = 'A wrapper for ChemSpider API'
  spec.homepage      = 'https://github.com/complat/ruspider'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
