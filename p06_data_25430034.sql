-- DATA SAMPEL MODUL 6
-- Database uji: klinik_sehat_raw_uji
-- NIM: 25430034 | Proyek: Klinik Pratama Sehat RAW
-- Import setelah p05_ddl_25430034.sql berhasil.
-- UJ-10 dilakukan terpisah; data awal detail_resep dibuat valid.

USE klinik_sehat_raw_uji;

-- 1. PASIEN (5)
INSERT INTO pasien (no_pasien, nik, nama_pasien, tanggal_lahir, jenis_kelamin, alamat, no_hp) VALUES
('PS999','1871000000000999','Rizky Pratama','2004-05-12','L','Jl. Melati No. 10, Metro','081234567899'),
('PS002','1871000000000002','Andi Saputra','2003-05-12','L','Metro Pusat','081234567802'),
('PS003','1871000000000003','Siti Rahma','2002-08-21','P','Metro Timur','081234567803'),
('PS004','1871000000000004','Budi Santoso','2001-11-10','L','Metro Barat','081234567804'),
('PS005','1871000000000005','Dewi Lestari','2004-02-15','P','Metro Selatan','081234567805');

-- 2. DOKTER (5)
INSERT INTO dokter (id_dokter, nama_dokter, spesialisasi, no_str, no_hp) VALUES
('D001','dr. Andi Saputra','Umum','STR001','081234567811'),
('D002','dr. Budi Hartono','Umum','STR002','081234567812'),
('D003','dr. Siti Aminah','Gigi','STR003','081234567813'),
('D004','dr. Rina Putri','Anak','STR004','081234567814'),
('D005','dr. Andika Pratama','Umum','STR005','081234567815');

-- 3. PETUGAS (5)
INSERT INTO petugas (id_petugas, nama_petugas, bagian) VALUES
('PT001','Siti Aminah','Administrasi'),
('PT002','Andi Wijaya','Administrasi'),
('PT003','Rina Amelia','Pendaftaran'),
('PT004','Doni Saputra','Farmasi'),
('PT005','Maya Sari','Administrasi');

-- 4. OBAT (5)
INSERT INTO obat (kode_obat, nama_obat, kategori, stok, harga) VALUES
('OB001','Paracetamol','Analgesik',10,5000),
('OB002','Amoxicillin','Antibiotik',30,8000),
('OB003','Ibuprofen','Analgesik',25,6000),
('OB004','Vitamin C','Vitamin',40,4000),
('OB005','Antasida','Obat Lambung',35,5000);

-- 5. PEMERIKSAAN (10; lebih dari 3 tanggal)
INSERT INTO pemeriksaan (no_pemeriksaan, tanggal_pemeriksaan, no_pasien, id_dokter, keluhan, diagnosis, tindakan) VALUES
('PM002','2026-11-02 09:00:00','PS002','D002','Demam dan batuk','Influenza','Pemberian obat'),
('PM003','2026-11-02 10:00:00','PS003','D003','Sakit gigi','Karies gigi','Pemeriksaan gigi'),
('PM004','2026-11-03 09:00:00','PS004','D004','Demam tinggi','Demam','Pemeriksaan umum'),
('PM005','2026-11-03 10:00:00','PS005','D005','Sakit kepala','Migrain','Pemeriksaan umum'),
('PM006','2026-11-04 09:00:00','PS002','D002','Nyeri tenggorokan','Faringitis','Pemberian obat'),
('PM007','2026-11-04 10:00:00','PS003','D003','Gusi bengkak','Gingivitis','Pemeriksaan gigi'),
('PM008','2026-11-05 09:00:00','PS004','D004','Batuk pilek','ISPA','Pemberian obat'),
('PM009','2026-11-05 10:00:00','PS005','D005','Nyeri perut','Gangguan pencernaan','Pemeriksaan umum'),
('PM998','2026-11-17 10:00:00','PS999','D001','Batuk dan pilek','Infeksi saluran pernapasan ringan','Pemeriksaan lanjutan'),
('PM999','2026-11-17 09:00:00','PS999','D001','Demam dan sakit kepala','Demam ringan','Pemeriksaan umum dan pemberian obat');

-- 6. RESEP (10)
INSERT INTO resep (no_resep, no_pemeriksaan, tanggal_resep) VALUES
('R001','PM999','2026-11-17'),
('R002','PM002','2026-11-02'),
('R003','PM003','2026-11-02'),
('R004','PM004','2026-11-03'),
('R005','PM005','2026-11-03'),
('R006','PM006','2026-11-04'),
('R007','PM007','2026-11-04'),
('R008','PM008','2026-11-05'),
('R009','PM009','2026-11-05'),
('R010','PM998','2026-11-17');

-- 7. DETAIL_RESEP (10 data valid)
-- R001-OB001 sengaja disisakan untuk pengujian UJ-10 terpisah.
INSERT INTO detail_resep (no_resep, kode_obat, jumlah, aturan_pakai) VALUES
('R001','OB002',5,'3 kali sehari'),
('R002','OB002',10,'3 kali sehari'),
('R003','OB003',5,'2 kali sehari'),
('R004','OB004',10,'1 kali sehari'),
('R005','OB005',5,'2 kali sehari'),
('R006','OB002',10,'3 kali sehari'),
('R007','OB003',5,'2 kali sehari'),
('R008','OB004',10,'1 kali sehari'),
('R009','OB005',5,'2 kali sehari'),
('R010','OB001',5,'3 kali sehari');

-- 8. PEMBAYARAN (10)
INSERT INTO pembayaran (no_pembayaran, no_pemeriksaan, tanggal_pembayaran, total_pembayaran, metode_bayar, id_petugas) VALUES
('BY001','PM999','2026-11-17 12:00:00',50000,'Tunai','PT001'),
('BY002','PM002','2026-11-02 12:00:00',80000,'Tunai','PT002'),
('BY003','PM003','2026-11-02 12:30:00',50000,'Transfer','PT003'),
('BY004','PM004','2026-11-03 12:00:00',65000,'Tunai','PT004'),
('BY005','PM005','2026-11-03 12:30:00',45000,'QRIS','PT005'),
('BY006','PM006','2026-11-04 12:00:00',75000,'Tunai','PT002'),
('BY007','PM007','2026-11-04 12:30:00',55000,'Transfer','PT003'),
('BY008','PM008','2026-11-05 12:00:00',60000,'QRIS','PT004'),
('BY009','PM009','2026-11-05 12:30:00',70000,'Tunai','PT005'),
('BY010','PM998','2026-11-17 13:00:00',85000,'Transfer','PT002');

-- 9. REKAP JUMLAH DATA
SELECT 'pasien' AS nama_tabel, COUNT(*) AS jumlah FROM pasien
UNION ALL SELECT 'dokter', COUNT(*) FROM dokter
UNION ALL SELECT 'petugas', COUNT(*) FROM petugas
UNION ALL SELECT 'obat', COUNT(*) FROM obat
UNION ALL SELECT 'pemeriksaan', COUNT(*) FROM pemeriksaan
UNION ALL SELECT 'resep', COUNT(*) FROM resep
UNION ALL SELECT 'detail_resep', COUNT(*) FROM detail_resep
UNION ALL SELECT 'pembayaran', COUNT(*) FROM pembayaran;

-- 10. CEK JUMLAH TANGGAL TRANSAKSI
SELECT COUNT(DISTINCT DATE(tanggal_pemeriksaan)) AS jumlah_tanggal_pemeriksaan FROM pemeriksaan;
SELECT COUNT(DISTINCT DATE(tanggal_pembayaran)) AS jumlah_tanggal_pembayaran FROM pembayaran;