# ✨ Eksa Framework

[![Ruby Version](https://img.shields.io/badge/ruby-3.0+-red.svg)](https://www.ruby-lang.org/)
[![Rack Version](https://img.shields.io/badge/rack-3.0+-blue.svg)](https://rack.github.io/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Framework Role](https://img.shields.io/badge/UI-Glassmorphism-indigo.svg)](#)

**Eksa Framework** adalah *micro-framework* MVC (Model-View-Controller) modern yang dibangun di atas Ruby dan Rack. Didesain untuk pengembang yang menginginkan kecepatan, kode yang bersih, dan tampilan antarmuka **Glassmorphism** yang elegan secara *out-of-the-box*.

---

## 🚀 Fitur Unggulan

* 💎 **Modern Glassmorphism UI**: Tampilan transparan yang indah dengan Tailwind CSS & Lucide Icons.
* ⚡ **Rack 3 Ready**: Menggunakan standar terbaru dengan penanganan header modern.
* 🛠️ **CLI Generator**: Siapkan struktur project instan dengan perintah `eksa-init`.
* 💾 **Auto-Migration DB**: Database SQLite otomatis dibuat saat server pertama kali dijalankan.
* 🔔 **Flash Messages**: Notifikasi animasi elegan yang kompatibel dengan cookie Rack 3.
* 🛤️ **Simple Routing**: Sistem routing yang eksplisit dan mudah dikelola di `config.ru`.
* 🔍 **Dynamic SEO Engine**: Penanganan otomatis file `robots.txt` dan `sitemap.xml` yang adaptif terhadap rute aplikasi.
* 🧩 **Smart Response Handling**: Framework kini mampu mendeteksi dan mengeksekusi array respons Rack manual untuk konten non-HTML (XML/Plain Text).

---

## 🛠️ Instalasi Cepat

### 1. Install via Gem
Anda bisa menginstal framework ini langsung dengan `gem`:

```bash
gem install eksa-framework
```

### 2. Inisialisasi Project Baru

Masuk ke folder baru, lalu jalankan generator Eksa:

```bash
mkdir my-awesome-app
cd my-awesome-app
eksa-init
```

### 3. Jalankan Server

```bash
bundle install
rackup config.ru
```

Buka browser dan akses `http://localhost:9292`.

---

## 💻 Panduan Pengembangan

### 1. Struktur Folder

Eksa memisahkan data dari logika aplikasi dengan folder `db` di level root:

* `app/`: Logic & Views (Controllers, Models, Views).
* `db/`: File database SQLite `eksa_app.db` (Terpisah dari app).
* `lib/eksa/`: Core Engine (The magic happens here).
* `public/`: File statis (CSS, Images, JS).

### 2. Menambah Route & Controller

Daftarkan rute di `config.ru`:

```ruby
app.add_route "/profil", PagesController, :profil
```

Buat method di `app/controllers/pages_controller.rb`:

```ruby
def profil
  render :profil # Merujuk ke app/views/profil.html.erb
end
```

### 3. Database & Model

Eksa akan otomatis membuat tabel saat Anda mendefinisikannya di `lib/eksa/model.rb`. Untuk menggunakan data di controller:

```ruby
@pesan = Pesan.all # Menggunakan model app/models/pesan.rb
```

---

## 🎨 Kustomisasi Visual

Eksa menggunakan **Tailwind CSS** dan **Animate.css**. Anda dapat mengatur efek kaca pada class `.glass` di `app/views/layout.html.erb`:

```css
.glass {
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(16px);
  border: 1px solid rgba(255, 255, 255, 0.1);
}
```

---

## 📜 Lisensi

Proyek ini dilisensikan di bawah **MIT License**. Lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.