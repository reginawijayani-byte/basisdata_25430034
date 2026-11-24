-- KI-03: Barang yang perlu dipesan ulang
SELECT
    kode_barang,
    nama_barang,
    stok_barang,
    stok_min_barang,
    stok_min_barang - stok_barang AS kurang
FROM barang
WHERE stok_barang < stok_min_barang
ORDER BY kurang DESC;

-- Menampilkan barang kategori ATK atau minuman
SELECT
    kode_barang,
    nama_barang,
    kategori_barang,
    harga_jual_barang
FROM barang
WHERE kategori_barang IN ('ATK', 'minuman');

-- Menampilkan penjualan bulan November 2026
SELECT
    no_nota_penjualan,
    tgl_penjualan,
    bayar_penjualan
FROM penjualan
WHERE tgl_penjualan BETWEEN
    '2026-11-01 00:00:00'
    AND '2026-11-30 23:59:59';

-- Menampilkan transaksi tanpa anggota terdaftar
SELECT
    no_nota_penjualan,
    tgl_penjualan,
    id_anggota,
    bayar_penjualan
FROM penjualan
WHERE id_anggota IS NULL;