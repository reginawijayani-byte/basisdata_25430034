# D. LANGKAH PERCOBAAN
## d.1 Dari UNF ke 1NF
### Bentuk UNF
NOTA_UNF (no_nota_penjualan, tgl_penjualan, kode_petugas, nama_petugas, 
no_anggota, nama_anggota,
          { kode_barang, nama_barang, qty_detail_penjualan, 
harga_satuan_detail_penjualan, subtotal_detail_penjualan },
          jumlah_penjualan, diskon_penjualan, total_penjualan)

### Bentuk 1NF
NOTA_1NF (no_nota_penjualan, kode_barang, tgl_penjualan, kode_petugas, 
nama_petugas, no_anggota,
          nama_anggota, nama_barang, qty_detail_penjualan, 
harga_satuan_detail_penjualan, subtotal_detail_penjualan, 
jumlah_penjualan, diskon_penjualan, total_penjualan)

## d.2 Menuliskan Dependensi Fungsional
FD1: no_nota_penjualan -> tgl_penjualan, kode_petugas, no_anggota 
(AB-01)
FD2: kode_petugas      -> nama_petugas
FD3: no_anggota        -> nama_anggota 
(AB-05)
FD4: kode_barang       -> nama_barang
FD5: (no_nota_penjualan, kode_barang)
                       -> qty_detail_penjualan, 
harga_satuan_detail_penjualan (AB-04)
FD6: qty_detail_penjualan, harga_satuan_detail_penjualan
                       -> subtotal_detail_penjualan 
(turunan)

## d.3 Menuju 2NF dan 3NF
### Bentuk 2NF
 PENJUALAN
(no_nota_penjualan (PK), tgl_penjualan, kode_petugas (FK), no_anggota (FK), bayar_penjualan)
DETAIL_PENJUALAN
(no_nota_penjualan (PK, FK), kode_barang (PK, FK), qty_detail_penjualan, harga_satuan_detail_penjualan)
BARANG
(kode_barang (PK), nama_barang, kategori_barang, harga_jual_barang, stok_barang, stok_min_barang)
PETUGAS
(kode_petugas (PK), nama_petugas, peran_petugas)
ANGGOTA
(no_anggota (PK), npm_anggota, nama_anggota, prodi_anggota, no_hp_anggota, status_anggota, tgl_daftar_anggota)

### Bentuk 3NF
PENJUALAN
(no_nota_penjualan (PK), tgl_penjualan, kode_petugas (FK), no_anggota (FK), bayar_penjualan)
DETAIL_PENJUALAN
(no_nota_penjualan (PK, FK), kode_barang (PK, FK), qty_detail_penjualan, harga_satuan_detail_penjualan)
BARANG
(kode_barang (PK), nama_barang, kategori_barang, harga_jual_barang, stok_barang, stok_min_barang)
PETUGAS
(kode_petugas (PK), nama_petugas, peran_petugas)
ANGGOTA
(no_anggota (PK), npm_anggota (AK), nama_anggota, prodi_anggota, no_hp_anggota, status_anggota, tgl_daftar_anggota)

## d.4 Mencocokkan dengan Skema Kanonik
###  Skema kanonik Kopma hasil normalisasi
| Tabel | Kunci Primer (PK) | Kunci Unik | Kunci Tamu (FK) |
|---|---|---|---|
| PETUGAS | `id_petugas` | `kode_petugas` | – |
| ANGGOTA | `id_anggota` | `no_anggota`, `npm_anggota` | – |
| BARANG | `id_barang` | `kode_barang` | – |
| PEMASOK | `id_pemasok` | – | – |
| PENJUALAN | `id_penjualan` | `no_nota_penjualan` | `id_petugas`, `id_anggota` (boleh NULL) |
| DETAIL_PENJUALAN | (`id_penjualan`, `id_barang`) | – | `id_penjualan`, `id_barang` |
| PEMBELIAN | `id_pembelian` | – | `id_pemasok` |
| DETAIL_PEMBELIAN | (`id_pembelian`, `id_barang`) | – | `id_pembelian`, `id_barang` |

### Tabel Pemeriksaan BCNF
| Tabel | Hasil Pemeriksaan | Keterangan |
|---|---|---|
| PETUGAS | Memenuhi BCNF | `id_petugas` dan `kode_petugas` menentukan data petugas. |
| ANGGOTA | Memenuhi BCNF | `id_anggota`, `no_anggota`, dan `npm_anggota` merupakan penentu unik. |
| BARANG | Memenuhi BCNF | `id_barang` dan `kode_barang` menentukan data barang. |
| PENJUALAN | Memenuhi BCNF | `id_penjualan` dan `no_nota_penjualan` menentukan data penjualan. |
| DETAIL_PENJUALAN | Memenuhi BCNF | Gabungan `id_penjualan` dan `id_barang` menjadi kunci primer. |
| PEMASOK | Memenuhi BCNF jika hanya bergantung pada `id_pemasok` | Perlu dipastikan tidak ada penentu lain yang bukan superkey. |
| PEMBELIAN | Memenuhi BCNF jika hanya bergantung pada `id_pembelian` | Data pembelian ditentukan oleh kunci primernya. |
| DETAIL_PEMBELIAN | Memenuhi BCNF | Gabungan `id_pembelian` dan `id_barang` menjadi kunci primer. |