CREATE DATABASE IF NOT EXISTS klinik_sehat_raw;
USE klinik_sehat_raw;

-- ----------------------------------------------------------------uw--
-- 1. TABEL PASIEN
-- -------------------------------------------------------------------
CREATE TABLE pasien (
    -- AB-01: Setiap tabel memiliki kunci primer (Primary Key)
    no_pasien VARCHAR(10) PRIMARY KEY,
    
    -- AB-02: NIK wajib unik dan tidak boleh kosong
    nik VARCHAR(20) UNIQUE NOT NULL,
    
    nama_pasien VARCHAR(100) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    
    -- AB-03: Aturan batas satu baris (P+2) diwujudkan dengan CHECK
    jenis_kelamin ENUM('L', 'P') NOT NULL,
    
    alamat TEXT NOT NULL,
    no_hp VARCHAR(15) NOT NULL
);

-- -------------------------------------------------------------------
-- 2. TABEL DOKTER
-- -------------------------------------------------------------------
CREATE TABLE dokter (
    id_dokter VARCHAR(10) PRIMARY KEY,
    nama_dokter VARCHAR(100) NOT NULL,
    spesialisasi VARCHAR(50) NOT NULL,
    no_str VARCHAR(30) UNIQUE NOT NULL,
    no_hp VARCHAR(15) NOT NULL
);

-- -------------------------------------------------------------------
-- 3. TABEL PETUGAS / ADMIN
-- -------------------------------------------------------------------
CREATE TABLE petugas (
    id_petugas VARCHAR(10) PRIMARY KEY,
    nama_petugas VARCHAR(100) NOT NULL,
    bagian VARCHAR(50) NOT NULL
);

-- -------------------------------------------------------------------
-- 4. TABEL OBAT
-- -------------------------------------------------------------------
CREATE TABLE obat (
    kode_obat VARCHAR(10) PRIMARY KEY,
    nama_obat VARCHAR(100) NOT NULL,
    kategori VARCHAR(50) NOT NULL,
    
    -- AB-04: Aturan batas satu baris (P+2) menggunakan CHECK (stok tidak boleh negatif)
    stok INT NOT NULL CHECK (stok >= 0),
    
    -- AB-05: Harga obat tidak boleh bernilai negatif
    harga DECIMAL(10,2) NOT NULL CHECK (harga >= 0)
);

-- -------------------------------------------------------------------
-- 5. TABEL PEMERIKSAAN (REKAM MEDIS)
-- -------------------------------------------------------------------
CREATE TABLE pemeriksaan (
    no_pemeriksaan VARCHAR(10) PRIMARY KEY,
    tanggal_pemeriksaan DATETIME NOT NULL,
    no_pasien VARCHAR(10) NOT NULL,
    id_dokter VARCHAR(10) NOT NULL,
    keluhan TEXT NOT NULL,
    diagnosis TEXT,
    tindakan TEXT,
    
    -- Setiap relasi ERD menjadi kunci tamu (Foreign Key)
    FOREIGN KEY (no_pasien) REFERENCES pasien(no_pasien) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- -------------------------------------------------------------------
-- 6. TABEL RESEP OBAT
-- -------------------------------------------------------------------
CREATE TABLE resep (
    no_resep VARCHAR(10) PRIMARY KEY,
    no_pemeriksaan VARCHAR(10) NOT NULL,
    tanggal_resep DATE NOT NULL,
    
    FOREIGN KEY (no_pemeriksaan) REFERENCES pemeriksaan(no_pemeriksaan) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -------------------------------------------------------------------
-- 7. TABEL DETAIL RESEP (Relasi Many-to-Many)
-- -------------------------------------------------------------------
CREATE TABLE detail_resep (
    no_resep VARCHAR(10) NOT NULL,
    kode_obat VARCHAR(10) NOT NULL,
    
    -- AB-06: Aturan batas satu baris (P+2) jumlah obat minimal 1
    jumlah INT NOT NULL CHECK (jumlah > 0),
    aturan_pakai VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (no_resep, kode_obat),
    FOREIGN KEY (no_resep) REFERENCES resep(no_resep) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (kode_obat) REFERENCES obat(kode_obat) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- -------------------------------------------------------------------
-- 8. TABEL PEMBAYARAN
-- -------------------------------------------------------------------
CREATE TABLE pembayaran (
    no_pembayaran VARCHAR(10) PRIMARY KEY,
    no_pemeriksaan VARCHAR(10) NOT NULL,
    tanggal_pembayaran DATETIME NOT NULL,
    total_pembayaran DECIMAL(10,2) NOT NULL CHECK (total_pembayaran >= 0),
    metode_bayar VARCHAR(30) NOT NULL,
    id_petugas VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (no_pemeriksaan) REFERENCES pemeriksaan(no_pemeriksaan) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas) ON UPDATE CASCADE ON DELETE RESTRICT
);