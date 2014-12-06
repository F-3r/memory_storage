lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memory_storage'

Gem::Specification.new do |spec|
  spec.name          = 'memory_storage'
  spec.version       = MemoryStorage::VERSION
  spec.authors       = ['f-3r']
  spec.email         = ['']
  spec.description   = 'Basic in memory persistence for fast prototyping'
  spec.summary       = 'Basic in memory persistence for fast prototyping'
  spec.homepage      = 'https://github.com/F-3r/memory_storage'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end
