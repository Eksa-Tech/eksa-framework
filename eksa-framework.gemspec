# frozen_string_literal: true

require_relative "lib/eksa/version"

Gem::Specification.new do |spec|
  spec.name          = "eksa-framework"
  spec.version       = Eksa::VERSION
  spec.authors       = ["IshikawaUta"]
  spec.email         = ["komikers09@gmail.com"]

  spec.summary       = "Modern Glassmorphism Ruby MVC Framework."
  spec.description   = "Framework MVC ringan dengan tema modern, sistem routing, dan dukungan multi-database (SQLite & MongoDB)."
  spec.homepage      = "https://github.com/IshikawaUta/eksa-framework"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/IshikawaUta/eksa-framework"
  spec.metadata["changelog_uri"]   = "https://github.com/IshikawaUta/eksa-framework/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    files = `git ls-files -z`.split("\x0")
    files += `git ls-files -zo --exclude-standard`.split("\x0")
    files.reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|features)/|\.(?:git|travis|circleci)|appveyor)}) || 
      f.end_with?('.gem') || !File.exist?(f)
    end
  end
  
  spec.bindir        = "exe"
  spec.executables   = ["eksa"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rack", "~> 3.0"
  spec.add_dependency "sqlite3", "~> 1.4"
  spec.add_dependency "puma", "~> 6.0"
  spec.add_dependency "rackup", "~> 2.3"
  spec.add_dependency "kramdown", "~> 2.4"
  spec.add_dependency "kramdown-parser-gfm", "~> 1.1"
  spec.add_dependency "bcrypt", "~> 3.1"
  spec.add_dependency "rack-session", "~> 2.0"
  spec.add_dependency "mongo", "~> 2.19"
  spec.add_dependency "dotenv", "~> 2.8"
  spec.add_dependency "bigdecimal", "~> 3.1"
  spec.add_dependency "eksa-mination", "~> 2.0"
end