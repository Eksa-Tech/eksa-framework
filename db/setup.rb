require 'sqlite3'

db = SQLite3::Database.new "eksa_app.db"

db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS pesan (
    id INTEGER PRIMARY KEY,
    konten TEXT,
    pengirim TEXT
  );
SQL

puts "Database Eksa berhasil disiapkan!"