require 'rack/test'

# Load the framework
require_relative '../lib/eksa'

# Set environment to test
ENV['RACK_ENV'] = 'test'

# EksaMination uses Object.new for its example context.
# We include Rack::Test::Methods into Object so it's available in all tests.
Object.include Rack::Test::Methods

# Monkeypatch EksaMination to fix a TypeError in Formatters::Documentation
# It currently fails when a description is a Class/Module (not a String)
require 'eksa-mination'
module EksaMination
  class ExampleGroup
    alias_method :original_description, :description
    def description
      original_description.to_s
    end
  end

  class Example
    alias_method :original_description, :description
    def description
      original_description.to_s
    end
  end

  module Formatters
    class Documentation
      def report_failure(example, error)
        super
        # Ensure failure message handles classes/modules too
        puts "  " * @level + colorize(example.description.to_s + " (FAILED)", :red)
      end
    end
  end
end
