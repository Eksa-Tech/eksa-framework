# ✨ Eksa Framework

[![Ruby Version](https://img.shields.io/badge/ruby-3.0+-red.svg)](https://www.ruby-lang.org/)
[![Rack Version](https://img.shields.io/badge/rack-3.0+-blue.svg)](https://rack.github.io/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Framework Role](https://img.shields.io/badge/UI-Glassmorphism-indigo.svg)](#)

**Eksa Framework** adalah *micro-framework* MVC (Model-View-Controller) modern yang dibangun di atas Ruby dan Rack. Didesain untuk pengembang yang menginginkan kecepatan, kode yang bersih, dan tampilan antarmuka **Glassmorphism** yang elegan secara *out-of-the-box*.

---

## 🚀 Fitur Unggulan

* 💎 **Modern Glassmorphism UI**: Tampilan transparan yang indah dengan Tailwind CSS & Lucide Icons.
* ⚡ **Rack 3 & Middleware Support**: Mendukung standar terbaru dan pembuatan pipeline middleware kustom.
* 🛠️ **Powerful CLI**: Inisialisasi project (`eksa init`), jalankan server (`eksa run`), dan generate komponen secara instan.
* 💾 **Dynamic Database Engine**: Database SQLite otomatis dengan schema yang ditentukan oleh model Anda sendiri.
* 🧪 **Built-in Testing**: Lingkungan pengujian otomatis siap pakai menggunakan RSpec dan `rack-test`.
* 🎨 **Asset Helpers**: Library bawaan untuk pengelolaan CSS dan JS yang lebih rapi.
* 🔍 **Dynamic SEO Engine**: Penanganan otomatis file `robots.txt` dan `sitemap.xml`.

---

## 🛠️ Instalasi Cepat

### 1. Install via Gem
```bash
gem install eksa-framework
```

### 2. Inisialisasi Project Baru
```bash
mkdir my-app && cd my-app
eksa init
```

### 3. Jalankan Server
```bash
bundle install
eksa run
```

---

## 💻 Panduan Pengembangan

### 1. Konfigurasi Aplikasi (`config.ru`)
Eksa kini menggunakan blok inisialisasi untuk konfigurasi yang lebih fleksibel:

```ruby
app = Eksa::Application.new do |config|
  config.config[:db_path] = "./db/production.db"
  
  config.use Rack::Static, urls: ["/css", "/img"], root: "public"
  config.use Rack::ShowExceptions
end
```

### 2. CLI Generator
Hemat waktu dengan menggunakan generator bawaan:

```bash
# Membuat controller dan view template
eksa g controller Blog

# Membuat model dan schema database
eksa g model Post
```

### 3. Database & Model
Definisikan schema tabel Anda langsung di dalam model:

```ruby
class Post < Eksa::Model
  def self.setup_schema
    db.execute <<~SQL
      CREATE TABLE IF NOT EXISTS posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    SQL
  end
end
```

### 4. Asset Helpers
Gunakan helper di dalam view untuk menyisipkan asset:

```erb
<%= stylesheet_tag "style" %>
<%= javascript_tag "app" %>
```

### 5. Menjalankan Test
Pastikan aplikasi Anda berjalan dengan benar menggunakan RSpec:

```bash
bundle exec rspec
```

---

## 📜 Lisensi
Proyek ini dilisensikan di bawah **MIT License**. Lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.