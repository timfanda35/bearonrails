require File.expand_path('../lib/bearonrails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'bearonrails'
  gem.version       = Bearonrails::VERSION

  gem.license       = 'MIT'
  gem.authors       = ['timfanda35']
  gem.email         = ['timfanda35@gmail.com']
  gem.summary       = 'A Base Rails application generator.'
  gem.description   = gem.summary
  gem.homepage      = 'https://github.com/timfanda35/bearonrails'

  gem.files         = `git ls-files`.split("\n").sort
  gem.executables   = ['bearonrails']
  gem.test_files    = gem.files.grep(/^(test|spec|features)\\/)
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.0'
  gem.add_dependency 'rails', '~>4.2', '>= 4.2.0'
end
