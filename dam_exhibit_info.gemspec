# frozen_string_literal: true

require_relative "lib/dam_exhibit_info/version"

Gem::Specification.new do |spec|
  spec.name          = "dam_exhibit_info"
  spec.version       = DamExhibitInfo::VERSION
  spec.authors       = ["Erika Curry-Elrod"]
  spec.email         = ["ecurryelrod@gmail.com"]

  spec.summary       = "Exhibit info at Denver Art Museum"
  spec.description   = "Provides information on current and upcoming exhibits at the Denver Art Museum"
  spec.homepage      = "https://www.denverartmuseum.org/en/exhibitions"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ecurryelrod"
  spec.metadata["changelog_uri"] = "Thttps://github.com/ecurryelrod/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_runtime_dependency 'nokogiri'
  spec.add_development_dependency 'pry'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
