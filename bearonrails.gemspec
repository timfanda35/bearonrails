lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bearonrails/version'

Gem::Specification.new do |gem|
  gem.name          = 'bootstrappers'
  gem.version       = Bearonrails::VERSION
  gem.authors       = ['timfanda35']
  gem.email         = ['timfanda35@gmail.com']
  gem.description   = 'Bearonrails is the base Rails application generator.'
  gem.summary       = 'Bearonrails is the base Rails application generator.'
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($RS)
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\\/)
  gem.require_paths = %w('lib')

  gem.add_dependency 'rails', '>= 4.2.0'
  gem.add_dependency 'bundler', '>= 1.7'
end
