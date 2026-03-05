class Pesan < Eksa::Model
  def self.semua
    db.execute("SELECT * FROM pesan ORDER BY id DESC")
  end

  def self.buat(konten, pengirim)
    db.execute("INSERT INTO pesan (konten, pengirim) VALUES (?, ?)", [konten.strip, pengirim.strip])
  end

  def self.cari(id)
    db.execute("SELECT * FROM pesan WHERE id = ?", [id]).first
  end

  def self.update(id, konten, pengirim)
    db.execute("UPDATE pesan SET konten = ?, pengirim = ? WHERE id = ?", [konten.strip, pengirim.strip, id])
  end

  def self.hapus(id)
    db.execute("DELETE FROM pesan WHERE id = ?", [id])
  end
  
  def self.cari_kata(keyword)
    db.execute("SELECT * FROM pesan WHERE konten LIKE ? OR pengirim LIKE ? ORDER BY id DESC", ["%#{keyword}%", "%#{keyword}%"])
  end
end