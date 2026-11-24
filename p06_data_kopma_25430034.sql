INSERT INTO petugas
(kode_petugas, nama_petugas, peran_petugas)
VALUES
('K01', 'Dimas', 'kasir'),
('K02', 'Sari', 'kasir'),
('K03', 'Rina', 'kasir'),
('G01', 'Joko', 'gudang'),
('P01', 'Ketua Kopma', 'ketua');

INSERT INTO barang
(kode_barang, nama_barang, kategori_barang,
harga_jual_barang, stok_barang, stok_min_barang)
VALUES
('ATK-001', 'Pulpen Gel 0.5', 'ATK', 4000, 120, 20),
('ATK-002', 'Buku Tulis 58', 'ATK', 6500, 80, 20),
('MNM-001', 'Air Mineral 600', 'minuman', 4000, 48, 24),
('MKN-001', 'Roti Cokelat', 'makanan', 5000, 6, 10);

INSERT INTO anggota
(no_anggota, nim_anggota, nama_anggota, prodi_anggota,
 no_hp_anggota, status_anggota, tgl_daftar_anggota)
VALUES
('AG-001', '23430101', 'Andi Saputra', 'Sistem Informasi',
 '081234567801', 'aktif', '2024-03-10'),

('AG-002', '23430102', 'Budi Santoso', 'Sistem Informasi',
 '081234567802', 'aktif', '2024-05-15'),

('AG-003', '23430103', 'Citra Amelia', 'Manajemen Informatika',
 '081234567803', 'nonaktif', '2024-08-20');

 INSERT INTO pemasok
(nama_pemasok, alamat_pemasok, no_hp_pemasok)
VALUES
('PT Sumber Makmur', 'Jl. Merdeka No. 10',
 '081234567811'),

('CV Berkah Jaya', 'Jl. Sudirman No. 25',
 '081234567812');

 INSERT INTO penjualan
(no_nota_penjualan, tgl_penjualan, id_petugas,
 id_anggota, bayar_penjualan)
VALUES
('PJ-2609-0142', '2026-09-14 10:00:00', 1, 1, 8000);

INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan,
 harga_satuan_detail_penjualan)
SELECT
    1,
    id_barang,
    2,
    harga_jual_barang
FROM barang
WHERE id_barang = 1;