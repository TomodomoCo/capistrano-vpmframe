# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-vpmframe'
  spec.version       = '1.4.2'
  spec.authors       = ['Chris Van Patten']
  spec.email         = ['info@vanpattenmedia.com']
  spec.description   = %q{Capistrano tasks for vpmframe websites}
  spec.summary       = %q{Capistrano tasks for vpmframe websites}
  spec.homepage      = 'https://github.com/vanpattenmedia/capistrano-vpmframe'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.1'
end
