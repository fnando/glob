# frozen_string_literal: true

require "./lib/glob/version"

Gem::Specification.new do |spec|
  spec.name          = "glob"
  spec.version       = Glob::VERSION
  spec.authors       = ["Nando Vieira"]
  spec.email         = ["me@fnando.com"]

  spec.summary       = [
    "Create a list of hash paths that match a given pattern.",
    "You can also generate a hash with only the matching paths."
  ].join(" ")
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/fnando/glob"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fnando/glob"
  spec.metadata["changelog_uri"] = "https://github.com/fnando/glob"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject {|f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-utils"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-fnando"
end
