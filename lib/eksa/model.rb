require 'sqlite3'
require 'fileutils'

module Eksa
  class Model
    class << self
      attr_accessor :database_path
    end

    def self.db
      path = database_path || default_db_path
      db_dir = File.dirname(path)
      FileUtils.mkdir_p(db_dir) unless Dir.exist?(db_dir)
      
      @db ||= SQLite3::Database.new(path)
      ensure_schema
      @db
    end

    def self.default_db_path
      File.expand_path("../../db/eksa_app.db", __dir__)
    end

    def self.ensure_schema
      return if @schema_initialized
      @schema_initialized = true
      setup_schema if respond_to?(:setup_schema)
    end
  end
end