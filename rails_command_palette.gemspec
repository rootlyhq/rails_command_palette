require_relative "lib/rails_command_palette/version"

Gem::Specification.new do |spec|
  spec.name = "rails_command_palette"
  spec.version = RailsCommandPalette::VERSION
  spec.authors = ["alexmingoia"]
  spec.email = ["alex@alexmingoia.com"]

  spec.summary = "A command palette for Rails using Stimulus and Ninja Keys."
  spec.description = "A command palette for Rails using Stimulus and Ninja Keys."
  spec.homepage = "https://github.com/alexmingoia/rails_command_palette".freeze
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_runtime_dependency 'railties', '>= 6.0'
  spec.add_development_dependency 'bundler', '>= 1.17', '<= 3'
  spec.add_development_dependency 'rake', '>= 7.0', '<= 20.0'
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
