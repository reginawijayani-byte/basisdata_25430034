DROP TABLE IF EXISTS detail_pembelian;
DROP TABLE IF EXISTS detail_penjualan;
DROP TABLE IF EXISTS pembelian;
DROP TABLE IF EXISTS penjualan;
DROP TABLE IF EXISTS pemasok;
DROP TABLE IF EXISTS anggota;
DROP TABLE IF EXISTS barang;
DROP TABLE IF EXISTS petugas;

USE kopma_34;
CREATE TABLE petugas (
  id_petugas    SMALLINT                       NOT NULL AUTO_INCREMENT,
  kode_petugas  CHAR(3)                        NOT NULL,
  nama_petugas  VARCHAR(100)                   NOT NULL,
  peran_petugas ENUM('kasir','gudang','ketua') NOT NULL,
  PRIMARY KEY (id_petugas),
  UNIQUE KEY uq_petugas_kode (kode_petugas)
) ENGINE=InnoDB;

CREATE TABLE barang (
  id_barang         INT                             NOT NULL 
AUTO_INCREMENT,
  kode_barang       VARCHAR(10)                     NOT NULL,
  nama_barang       VARCHAR(100)                    NOT NULL,
  kategori_barang   ENUM('ATK','makanan','minuman') NOT NULL,
  harga_jual_barang DECIMAL(12,2)                   NOT NULL,
  stok_barang       INT                             NOT NULL DEFAULT 0,
  stok_min_barang   INT                             NOT NULL DEFAULT 5,
  PRIMARY KEY (id_barang),
  UNIQUE KEY uq_barang_kode (kode_barang),
  CONSTRAINT ck_barang_stok  CHECK (stok_barang >= 0),
  CONSTRAINT ck_barang_harga CHECK (harga_jual_barang >= 0)
) ENGINE=InnoDB;

-- Tabel anggota
CREATE TABLE anggota (
    id_anggota INT NOT NULL AUTO_INCREMENT,
    no_anggota VARCHAR(20) NOT NULL,
    nim_anggota VARCHAR(20) NOT NULL,
    nama_anggota VARCHAR(100) NOT NULL,
    prodi_anggota VARCHAR(100) NOT NULL,
    no_hp_anggota VARCHAR(20) NOT NULL,
    status_anggota ENUM('aktif','nonaktif') NOT NULL,
    tgl_daftar_anggota DATE NOT NULL,
    PRIMARY KEY (id_anggota),
    UNIQUE KEY uq_anggota_no (no_anggota),
    UNIQUE KEY uq_anggota_nim (nim_anggota)
) ENGINE=InnoDB;

-- Tabel pemasok
CREATE TABLE pemasok (
    id_pemasok INT NOT NULL AUTO_INCREMENT,
    nama_pemasok VARCHAR(100) NOT NULL,
    alamat_pemasok VARCHAR(255) NOT NULL,
    no_hp_pemasok VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_pemasok)
) ENGINE=InnoDB;


-- 1. Tabel penjualan
CREATE TABLE penjualan (
    id_penjualan INT NOT NULL AUTO_INCREMENT,
    no_nota_penjualan CHAR(12) NOT NULL,
    tgl_penjualan DATETIME NOT NULL,
    id_petugas SMALLINT NOT NULL,
    id_anggota INT NULL,
    bayar_penjualan DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id_penjualan),
    UNIQUE KEY uq_penjualan_nota (no_nota_penjualan),
    CONSTRAINT fk_penjualan_petugas
        FOREIGN KEY (id_petugas)
        REFERENCES petugas (id_petugas),
    CONSTRAINT fk_penjualan_anggota
        FOREIGN KEY (id_anggota)
        REFERENCES anggota (id_anggota)
) ENGINE=InnoDB;


-- 2. Tabel detail_penjualan
CREATE TABLE detail_penjualan (
    id_penjualan INT NOT NULL,
    id_barang INT NOT NULL,
    qty_detail_penjualan SMALLINT NOT NULL,
    harga_satuan_detail_penjualan DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id_penjualan, id_barang),
    CONSTRAINT fk_detail_penjualan_penjualan
        FOREIGN KEY (id_penjualan)
        REFERENCES penjualan (id_penjualan)
        ON DELETE CASCADE,
    CONSTRAINT fk_detail_penjualan_barang
        FOREIGN KEY (id_barang)
        REFERENCES barang (id_barang),
    CONSTRAINT ck_detail_penjualan_qty
        CHECK (qty_detail_penjualan > 0)
) ENGINE=InnoDB;


-- 3. Tabel pembelian
CREATE TABLE pembelian (
    id_pembelian INT NOT NULL AUTO_INCREMENT,
    no_faktur_pembelian VARCHAR(20) NOT NULL,
    tgl_pembelian DATE NOT NULL,
    id_pemasok INT NOT NULL,
    status_pembelian ENUM('dipesan','diterima')
        NOT NULL DEFAULT 'dipesan',
    PRIMARY KEY (id_pembelian),
    CONSTRAINT fk_pembelian_pemasok
        FOREIGN KEY (id_pemasok)
        REFERENCES pemasok (id_pemasok)
) ENGINE=InnoDB;


-- 4. Tabel detail_pembelian
CREATE TABLE detail_pembelian (
    id_pembelian INT NOT NULL,
    id_barang INT NOT NULL,
    qty_detail_pembelian INT NOT NULL,
    harga_beli_detail_pembelian DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id_pembelian, id_barang),
    CONSTRAINT fk_dbeli_pembelian
        FOREIGN KEY (id_pembelian)
        REFERENCES pembelian (id_pembelian)
        ON DELETE CASCADE,
    CONSTRAINT fk_dbeli_barang
        FOREIGN KEY (id_barang)
        REFERENCES barang (id_barang),
    CONSTRAINT ck_dbeli_qty
        CHECK (qty_detail_pembelian > 0)
) ENGINE=InnoDB;