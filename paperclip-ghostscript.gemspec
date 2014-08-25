# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/ghostscript'

Gem::Specification.new do |spec|
  spec.name          = "paperclip-ghostscript"
  spec.version       = Paperclip::Ghostscript::VERSION
  spec.authors       = ["Adam Cuppy"]
  spec.email         = ["adam@codingzeal.com"]
  spec.summary       = %q{Paperclip processor for the Ghostscript library}
  spec.description   = %q{Paperclip processor for the Ghostscript library}
  spec.homepage      = "https://github.com/CodingZeal/paperclip-ghostscript"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "paperclip"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-debugger"
end
