# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "apitester/version"

Gem::Specification.new do |spec|
  spec.name          = "apitester"
  spec.version       = Apitester::VERSION
  spec.authors       = ["Shreyas Agarwal"]
  spec.email         = ["agarwal@fidor.com"]

  spec.summary       = %q{Allows you to make calls to the APIs}
  spec.description   = %q{This gem allows you to make GET/POST/PUT/DELETE calls to the APIs and allows you to validate the response and the header operations}
  spec.homepage      = "http://www.whathomepage.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard-rspec"

  spec.add_dependency "rspec", "~> 3.0"
  spec.add_dependency 'webmock', '~>  3.1'
  spec.add_dependency 'faraday', '~>  0.13'
end
