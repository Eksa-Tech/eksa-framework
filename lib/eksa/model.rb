require 'sqlite3'
require 'fileutils'

module Eksa
  class Model
    def self.db
      db_dir = File.expand_path("../../db", __dir__)
      db_path = File.join(db_dir, "eksa_app.db")
      FileUtils.mkdir_p(db_dir) unless Dir.exist?(db_dir)
      @db ||= SQLite3::Database.new(db_path)
      setup_initial_schema
      @db
    end

    def self.setup_initial_schema
      @db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS pesan (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          konten TEXT,
          pengirim TEXT
        );
      SQL
    end
  end
end