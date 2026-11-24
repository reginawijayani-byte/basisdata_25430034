-- ==========================================
-- P07 KUERI PROYEK KLINIK PRATAMA SEHAT RAW
-- NIM: 25430034
-- Database: klinik_sehat_raw_uji
-- ==========================================

USE klinik_sehat_raw_uji;


-- KI-01: Riwayat pemeriksaan pasien
-- Menampilkan seluruh riwayat pemeriksaan pasien PS999
-- Hasil yang diharapkan: Menampilkan riwayat pemeriksaan
-- pasien PS999 beserta tanggal, dokter, keluhan,
-- diagnosis, dan tindakan.
SELECT
    no_pemeriksaan,
    tanggal_pemeriksaan,
    no_pasien,
    id_dokter,
    keluhan,
    diagnosis,
    tindakan
FROM pemeriksaan
WHERE no_pasien = 'PS999'
ORDER BY tanggal_pemeriksaan DESC;


-- KI-01: Informasi pemeriksaan berdasarkan diagnosis
-- Mencari pemeriksaan dengan diagnosis demam
-- Hasil yang diharapkan: Menampilkan data pemeriksaan
-- yang memiliki diagnosis mengandung kata Demam.
SELECT
    no_pemeriksaan,
    tanggal_pemeriksaan,
    no_pasien,
    diagnosis
FROM pemeriksaan
WHERE diagnosis LIKE '%Demam%';


-- KI-02: Daftar pasien yang diperiksa dalam periode tertentu
-- Menampilkan pemeriksaan selama November 2026
-- Hasil yang diharapkan: Menampilkan nomor pasien,
-- nomor pemeriksaan, dan tanggal pemeriksaan.
SELECT
    no_pasien,
    no_pemeriksaan,
    tanggal_pemeriksaan
FROM pemeriksaan
WHERE tanggal_pemeriksaan >= '2026-11-01'
AND tanggal_pemeriksaan < '2026-12-01'
ORDER BY tanggal_pemeriksaan;


-- KI-02: Menghitung pasien yang diperiksa
-- Menampilkan jumlah pasien berbeda dalam November 2026
-- Hasil yang diharapkan: Menampilkan jumlah pasien
-- yang berbeda dan melakukan pemeriksaan pada bulan tersebut.
SELECT
    COUNT(DISTINCT no_pasien) AS jumlah_pasien
FROM pemeriksaan
WHERE tanggal_pemeriksaan >= '2026-11-01'
AND tanggal_pemeriksaan < '2026-12-01';


-- KI-03: Daftar obat dengan stok paling sedikit
-- Mengurutkan obat berdasarkan stok terendah
-- Hasil yang diharapkan: Menampilkan daftar obat
-- yang diurutkan dari stok paling sedikit.
SELECT
    kode_obat,
    nama_obat,
    kategori,
    stok
FROM obat
ORDER BY stok ASC;


-- KI-03: Mencari obat dengan stok rendah
-- Menampilkan obat yang stoknya 10 atau kurang
-- Hasil yang diharapkan: Menampilkan daftar obat
-- dengan jumlah stok maksimal 10.
SELECT
    kode_obat,
    nama_obat,
    stok
FROM obat
WHERE stok <= 10
ORDER BY stok ASC;


-- KI-04: Pendapatan klinik per hari
-- Menghitung total pendapatan setiap tanggal
-- Hasil yang diharapkan: Menampilkan tanggal pembayaran
-- dan total pendapatan pada setiap tanggal.
SELECT
    DATE(tanggal_pembayaran) AS tanggal,
    SUM(total_pembayaran) AS total_pendapatan
FROM pembayaran
GROUP BY DATE(tanggal_pembayaran)
ORDER BY tanggal;


-- KI-04: Pendapatan klinik per bulan
-- Menghitung total pendapatan bulan November 2026
-- Hasil yang diharapkan: Menampilkan total pendapatan
-- klinik selama bulan November 2026.
SELECT
    DATE_FORMAT(tanggal_pembayaran, '%Y-%m') AS bulan,
    SUM(total_pembayaran) AS total_pendapatan
FROM pembayaran
WHERE tanggal_pembayaran >= '2026-11-01'
AND tanggal_pembayaran < '2026-12-01'
GROUP BY DATE_FORMAT(tanggal_pembayaran, '%Y-%m');


-- KI-05: Jumlah pemeriksaan setiap dokter
-- Menghitung jumlah pemeriksaan berdasarkan ID dokter
-- Hasil yang diharapkan: Menampilkan ID dokter
-- beserta jumlah pemeriksaan yang ditangani.
SELECT
    id_dokter,
    COUNT(*) AS jumlah_pemeriksaan
FROM pemeriksaan
GROUP BY id_dokter
ORDER BY jumlah_pemeriksaan DESC;


-- KI-05: Detail pemeriksaan dokter
-- Menampilkan pemeriksaan yang ditangani dokter D001
-- Hasil yang diharapkan: Menampilkan daftar pemeriksaan
-- dokter D001 beserta tanggal, pasien, keluhan, dan diagnosis.
SELECT
    no_pemeriksaan,
    tanggal_pemeriksaan,
    no_pasien,
    keluhan,
    diagnosis
FROM pemeriksaan
WHERE id_dokter = 'D001'
ORDER BY tanggal_pemeriksaan DESC;