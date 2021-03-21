# frozen_string_literal: true

require_relative "lib/retention_plans/version"

Gem::Specification.new do |spec|
  spec.name          = "retention_plans"
  spec.version       = RetentionPlans::VERSION
  spec.authors       = ["José Esmerino"]
  spec.email         = ["jose.esmerino@gmail.com"]

  spec.summary       = "Check retetion by time and plans"
  spec.description   = "Check if files can be retetion or delete"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec',  '>= 3.0.0'
end
