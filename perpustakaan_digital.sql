use perpustakaan_digital;
create table kategori (
	id_kategori int primary key auto_increment,
	nama_kategori varchar(100)
);
create table buku(
	id_buku int primary key auto_increment,
	judul varchar(100),
	pengarang varchar(100),
	penerbit varchar(100),
	tahun_terbit varchar(100),
	stok int,
	id_kategori int,
	foreign key (id_kategori) references kategori (id_kategori)
);
create table anggota(
	id_anggota int primary key auto_increment,
	nama varchar(100),
	nim int,
	jurusan varchar (100),
	angkatan year	
);
create table peminjaman (
	id_peminjaman int primary key auto_increment,
	id_anggota int,
	id_buku int,
	tanggal_pinjam date,
	tanggal_pengembalian date,
	status enum('dipinjam', 'dikembalikan') default 'dipinjam',
	foreign key (id_anggota) references anggota (id_anggota),
	foreign key (id_buku) references buku (id_buku)
);
create table pengembalian (
	id_pengembalian int primary key auto_increment,
	id_peminjaman int,
	tanggal_kembali date,
	foreign key (id_peminjaman) references peminjaman (id_peminjaman)
);
create table denda (
	id_denda int primary key auto_increment,
	id_pengembalian int,
	jumlah int,
	keterangan varchar(100),
	foreign key (id_pengembalian) references pengembalian (id_pengembalian)
);
create table denda (
	id_denda int primary key auto_increment,
	id_pengembalian int,
	jumlah int,
	keterangan varchar(100),
	foreign key (id_pengembalian) references pengembalian (id_pengembalian)
);
insert into kategori (nama_kategori) values 
('teknologi'),
('sains'),
('psikologi'),
('sastra'),
('filsafat');
select*from kategori;
insert into buku(judul, pengarang, penerbit, tahun_terbit, stok, id_kategori) values
('Dasar-Dasar Pemrograman', 'Andi Prasetyo', 'Informatika', 2022, 5, 1),
('Pengantar Sains Data', 'Lia Wijaya', 'Deep Publisher', 2023, 3, 2),
('Psikologi Remaja', 'Dr. Rahmawati', 'Bhuana Ilmu', 2020, 4, 3),
('Kumpulan Puisi Modern', 'Dimas Putra', 'Gramedia', 2021, 2, 4),
('Filsafat Pendidikan', 'Imam M.', 'Rajagrafindo', 2019, 6, 5);
select*from buku;
insert into anggota(nama,nim,jurusan,angkatan) values
('Aulia Salsabila', '12022001', 'Sains Data', 2022),
('Fahmi Ramadhan', '12022002', 'Teknik Informatika', 2021),
('Nadia Zahra', '12022003', 'Sistem Informasi', 2023),
('Rizky Hidayat', '12022004', 'Sains Data', 2022),
('Indah Permata', '12022005', 'Teknik Komputer', 2021);
select*from anggota;
insert into peminjaman (id_anggota, id_buku, tanggal_pinjam, tanggal_pengembalian, status)
values
(1, 2, '2025-06-25', '2025-07-02', 'dikembalikan'),
(2, 1, '2025-06-28', NULL, 'dipinjam'),
(3, 3, '2025-06-20', '2025-06-27', 'dikembalikan'),
(4, 5, '2025-06-26', NULL, 'dipinjam'),
(5, 4, '2025-06-22', '2025-06-29', 'dikembalikan');
select*from peminjaman;
insert into pengembalian (id_peminjaman, tanggal_kembali) values
(1, '2025-07-02'),
(3, '2025-06-27'),
(5, '2025-06-29');
select*from pengembalian;
insert into denda (id_pengembalian, jumlah, keterangan) values
(1, 5000, 'Terlambat 1 hari'),
(2, 0, 'Tepat waktu');
select*from denda;
select 
	p.id_peminjaman,
	a.nama as nama_anggota,
	b.judul as judul_buku,
	p.tanggal_pinjam,
	p.tanggal_pengembalian,
	p.status
from peminjaman p
join anggota a on p.id_anggota= a.id_anggota
join buku b on p.id_buku = b.id_buku;
select
	a.nama,
	b.judul,
	p.tanggal_pinjam
from peminjaman p
join anggota a on p.id_anggota = a.id_anggota 
join buku b on p.id_buku = b.id_buku;
select
	pg.id_pengembalian,
	a.nama,
	b.judul,
	pg.tanggal_kembali as tgl_pengembalian,
	d.jumlah as denda
from pengembalian pg
join peminjaman p on p.id_peminjaman = p.id_peminjaman
join anggota a on a.id_anggota = a.id_anggota
join buku b on b.id_buku = b.id_buku
left join denda d on pg.id_pengembalian = d.id_pengembalian;
select a.nama, SUM(DISTINCT d.jumlah) AS total_denda
from denda d
join pengembalian pg ON d.id_pengembalian = pg.id_pengembalian
join peminjaman p ON pg.id_peminjaman = p.id_peminjaman
join anggota a ON p.id_anggota = a.id_anggota
group by a.nama
order by total_denda DESC;

select*from denda;
SELECT a.nama, d.jumlah
FROM denda d
JOIN pengembalian pg ON d.id_pengembalian = pg.id_pengembalian
JOIN peminjaman p ON pg.id_peminjaman = p.id_peminjaman
JOIN anggota a ON p.id_anggota = a.id_anggota;
update denda set jumlah = 10000 where id_denda = 4;
update denda set jumlah = 5000 where id_denda = 5;
