# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faker/russian'

Gem::Specification.new do |spec|
  spec.name          = 'faker-russian'
  spec.version       = Faker::Russian.version
  spec.authors       = ['Alex']
  spec.email         = ['kaburbundokel11g@inbox.ru']
  spec.homepage      = 'http://github.com/asiniy/faker-russian'
  spec.summary       = %q{Faker russian specific values. INN, OGRN, et.c.}
  spec.description   = %q{Faker russian specific values. INN, OKPO, OGRN et.c.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'faker', '~> 1.3'
  spec.add_development_dependency 'validates_russian', '0.0.8'
end
