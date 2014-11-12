# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/ec2_tagged/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-ec2_tagged"
  spec.version       = Capistrano::Ec2Tagged::VERSION
  spec.authors       = ["Masato Ikeda"]
  spec.email         = ["masato.ikeda@gmail.com"]
  spec.summary       = %q{Get ip addresses of AWS EC2 instances filtered by their tags.}
  spec.description   = %q{Get ip addresses of AWS EC2 instances filtered by their tags.}
  spec.homepage      = "https://github.com/a2ikm/capistrano-ec2_tagged"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk", "< 2"
  spec.add_dependency "capistrano", "~> 3.0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
