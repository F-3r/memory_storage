lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memory_storage'

Gem::Specification.new do |spec|
  spec.name          = "Memory Storage"
  spec.version       = MemoryStorage::VERSION
  spec.authors       = ["TTPS-ruby"]
  spec.email         = [""]
  spec.description   = "Basic in memory persistence facility for prototypes projects"
  spec.summary       = "Basic in memory persistence facility for prototypes projects"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
