
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sucker_punch/statsd/version'

Gem::Specification.new do |spec|
  spec.name          = 'sucker_punch-statsd'
  spec.version       = SuckerPunch::Statsd::VERSION
  spec.authors       = ['Michael Coyne']
  spec.email         = ['mikeycgto+sucker-punch-statsd@gmail.com']

  spec.summary       = %q{statsd integration for sucker_punch}
  spec.description   = %q{Seamlessly integrate statsd with your sucker_punch jobs}
  spec.homepage      = 'https://github.com/mjc-gh/sucker_punch-statsd'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'sucker_punch'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
