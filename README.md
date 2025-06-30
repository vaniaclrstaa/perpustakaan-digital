# perpustakaan-digital
Proyek SQL Sistem Perpustakaan
# 📚 Proyek SQL: Sistem Perpustakaan Digital

Proyek ini merupakan simulasi sistem manajemen perpustakaan berbasis relational database, dibangun menggunakan MariaDB dan dikelola melalui DBeaver. Proyek ini mencakup pembuatan tabel relasional, relasi antar tabel, pengisian data (dummy), serta query untuk laporan dan analisis data.

---

## 🗂️ Struktur Tabel

1. **kategori**  
   Menyimpan kategori buku  
   Kolom: `id_kategori`, `nama_kategori`

2. **buku**  
   Menyimpan informasi buku  
   Kolom: `id_buku`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `stok`, `id_kategori`

3. **anggota**  
   Menyimpan data mahasiswa/pengguna perpustakaan  
   Kolom: `id_anggota`, `nama`, `nim`, `jurusan`, `angkatan`

4. **peminjaman**  
   Menyimpan transaksi peminjaman buku  
   Kolom: `id_peminjaman`, `id_anggota`, `id_buku`, `tanggal_pinjam`, `tanggal_pengembalian`, `status`

5. **pengembalian**  
   Menyimpan informasi pengembalian buku  
   Kolom: `id_pengembalian`, `id_peminjaman`, `tanggal_kembali`

6. **denda**  
   Menyimpan data denda dari keterlambatan  
   Kolom: `id_denda`, `id_pengembalian`, `jumlah`, `keterangan`

---

## 📌 Contoh Fitur & Query

### 🔎 Menampilkan Daftar Peminjaman

```sql
SELECT 
  p.id_peminjaman,
  a.nama AS nama_anggota,
  b.judul AS judul_buku,
  p.tanggal_pinjam,
  p.tanggal_pengembalian,
  p.status
FROM peminjaman p
JOIN anggota a ON p.id_anggota = a.id_anggota
JOIN buku b ON p.id_buku = b.id_buku;
```
Tools:
Maria DB/MySQL
DBeaver
SQL
Tujuan Pembelajaran
Memahami konsep relasi antar tabel di RDBMS
Membuat struktur database dan mengelola data dengan SQL
Membuat query analisis seperti JOIN, GROUP BY, dan ORDER


Dibuat oleh: 
Vania Claresta
Mahasiswa Sains Data
Institut Teknologi Sumatera
