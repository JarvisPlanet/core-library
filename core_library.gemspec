lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'core_library/version'

Gem::Specification.new do |s|
  s.name    = 'core-library'
  s.version = CoreLibrary::VERSION

  s.authors     = ['Nipun Tanay']
  s.email       = ['nipuntanay@gmail.com']
  s.description = 'Core test automation library for Covid APIs'

  s.files = `git ls-files`.split("\n")

  s.require_paths = ['lib']
  s.summary       = 'Covid19 API service models and API for automation tests'
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_dependency('httparty')
  s.add_dependency('json')
  s.add_dependency('hashie')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rake')
end
