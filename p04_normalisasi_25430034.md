# F. Tugas Mandiri: Milestone Proyek 4
## F1. Menentukan Dokumen Sumber dan Bentuk UNF
NOTA_PEMBAYARAN_UNF (
    no_pembayaran,
    no_pasien,
    nama_pasien,
    tanggal_pembayaran,
    metode_pembayaran,
    nama_kasir,
    {nama_item, jumlah, harga_satuan},
    total_pembayaran
)
penjelasan: Bentuk UNF dibuat dengan menggabungkan data pembayaran dan item yang dibayarkan. Krna satu nota dapat memuat beberapa layanan atau obat, terdapat grup data berulang.

## F2. Dependensi Fungsional dan Aturan Bisnis
| Kode | Dependensi Fungsional | Dasar Aturan Bisnis |
|---|---|---|
| FD1 | `no_pasien → NIK, nama_pasien, tanggal_lahir, jenis_kelamin, alamat_pasien, no_hp_pasien` | AB-01: Setiap pasien memiliki nomor pasien yang unik. |
| FD2 | `id_dokter → nama_dokter, spesialisasi, no_str, no_hp_dokter` | Data dokter ditentukan oleh ID dokter. |
| FD3 | `no_pemeriksaan → no_pasien, id_dokter, tanggal_pemeriksaan, keluhan, diagnosis, tindakan` | AB-03 dan AB-04: Setiap pemeriksaan memiliki pasien dan dokter, serta hasil pemeriksaan dicatat dokter. |
| FD4 | `no_resep → no_pemeriksaan, tanggal_resep` | AB-05: Resep dibuat berdasarkan pemeriksaan yang telah dilakukan. |
| FD5 | `kode_obat → nama_obat, kategori_obat, stok_obat, harga_obat` | Data obat ditentukan oleh kode obat. |
| FD6 | `(no_resep, kode_obat) → jumlah_obat, aturan_pakai` | Satu resep dapat memuat beberapa obat dengan jumlah dan aturan pakai masing-masing. |
| FD7 | `no_pembayaran → no_pemeriksaan, tanggal_pembayaran, total_pembayaran, metode_pembayaran` | AB-07: Nomor pembayaran unik dan terkait dengan pemeriksaan pasien. |
penjelasan: FD1–FD7 merupakan rancangan dependensi berdasarkan atribut dan aturan bisnis yang tersedia. Dokumen belum menjelaskan secara lengkap semua aturan keunikan, sehingga dependensi tambahan perlu dikonfirmasi jika ada aturan bisnis baru.

## F3.Tahapan Normalisasi
### 1. Bentuk 1NF (First Normal Form)
NOTA_PEMBAYARAN_1NF (
    no_pembayaran,
    no_item,
    no_pasien,
    nama_pasien,
    tanggal_pembayaran,
    metode_pembayaran,
    nama_kasir,
    nama_item,
    jumlah,
    harga_satuan,
    total_pembayaran
)

PK: (no_pembayaran, no_item)
penjelasan: Bentuk 1NF diperoleh dengan menghilangkan grup data berulang pada nota pembayaran. Setiap baris hanya mencatat satu item layanan atau obat.

### 2. Bentuk 2NF (Second Normal Form)
PEMBAYARAN (
    no_pembayaran (PK),
    no_pemeriksaan (FK),
    tanggal_pembayaran,
    total_pembayaran,
    metode_pembayaran
)
DETAIL_PEMBAYARAN (
    no_pembayaran (PK, FK),
    no_item (PK),
    nama_item,
    jumlah,
    harga_satuan
)
PASIEN (
    no_pasien (PK),
    NIK,
    nama_pasien,
    tanggal_lahir,
    jenis_kelamin,
    alamat_pasien,
    no_hp_pasien
)
DOKTER (
    id_dokter (PK),
    nama_dokter,
    spesialisasi,
    no_str,
    no_hp_dokter
)
OBAT (
    kode_obat (PK),
    nama_obat,
    kategori_obat,
    stok_obat,
    harga_obat
)
penjelasan: Bentuk 2NF menghilangkan ketergantungan parsial, yaitu atribut yang hanya bergantung pada sebagian kunci primer gabungan. Pemisahan ini membuat informasi pembayaran, pasien, dokter, dan obat tidak perlu dicatat berulang kali dalam satu tabel transaksi.

### 3. Bentuk 3NF (Third Normal Form)
1. PASIEN (
    no_pasien (PK),
    NIK,
    nama_pasien,
    tanggal_lahir,
    jenis_kelamin,
    alamat_pasien,
    no_hp_pasien
)

2. DOKTER (
    id_dokter (PK),
    nama_dokter,
    spesialisasi,
    no_str,
    no_hp_dokter
)

3. PETUGAS (
    id_petugas (PK),
    nama_petugas,
    bagian
)

4. PEMERIKSAAN (
    no_pemeriksaan (PK),
    tanggal_pemeriksaan,
    no_pasien (FK),
    id_dokter (FK),
    keluhan,
    diagnosis,
    tindakan
)

5. RESEP (
    no_resep (PK),
    no_pemeriksaan (FK),
    tanggal_resep
)

6. OBAT (
    kode_obat (PK),
    nama_obat,
    kategori_obat,
    stok_obat,
    harga_obat
)

7. DETAIL_RESEP (
    no_resep (PK, FK),
    kode_obat (PK, FK),
    jumlah_obat,
    aturan_pakai
)

8. PEMBAYARAN (
    no_pembayaran (PK),
    no_pemeriksaan (FK),
    id_petugas (FK),
    tanggal_pembayaran,
    metode_pembayaran
)

9. DETAIL_PEMBAYARAN (
    no_pembayaran (PK, FK),
    no_item (PK),
    nama_item,
    jumlah,
    harga_satuan
)

## 4.Hasil Pemeriksaan BCNF
| Tabel | Hasil Pemeriksaan | Keterangan |
|---|---|---|
| PASIEN | Memenuhi BCNF | `no_pasien` menjadi penentu data pasien. |
| DOKTER | Memenuhi BCNF | `id_dokter` menjadi penentu data dokter. |
| PETUGAS | Memenuhi BCNF | `id_petugas` menjadi penentu data petugas. |
| PEMERIKSAAN | Memenuhi BCNF | `no_pemeriksaan` menentukan data pemeriksaan. |
| RESEP | Memenuhi BCNF | `no_resep` menentukan data resep. |
| OBAT | Memenuhi BCNF | `kode_obat` menentukan data obat. |
| DETAIL_RESEP | Memenuhi BCNF | Kunci gabungan menentukan jumlah dan aturan pakai. |
| PEMBAYARAN | Memenuhi BCNF | `no_pembayaran` menentukan data pembayaran. |
| DETAIL_PEMBAYARAN | Memenuhi BCNF jika tidak ada penentu lain | Kunci gabungan harus menentukan seluruh atribut detail. |

## F4.Putuskan penyimpanan setiap nilai turunan Beserta 
### 1.Putuskan penyimpanan setiap nilai turunan 
| Nilai Turunan | Cara Menghitung | Keputusan | Alasan |
|---|---|---|---|
| Subtotal item | `jumlah × harga_satuan` | Tidak disimpan | Dapat dihitung saat dibutuhkan. |
| Total pembayaran | Penjumlahan seluruh biaya item | Tidak disimpan pada rancangan awal | Menghindari ketidakkonsistenan antara detail dan total. |
| Jumlah pemeriksaan dokter | Menghitung data pemeriksaan berdasarkan dokter | Tidak disimpan | Dapat diperoleh melalui query. |
| Pendapatan harian/bulanan | Menjumlahkan transaksi pembayaran dalam periode tertentu | Tidak disimpan | Dapat dihitung sesuai periode laporan. |

## F5.Perubahan ERD Proyek
Berdasarkan hasil normalisasi, ERD proyek perlu diperiksa dan disesuaikan dengan perubahan berikut.
1. Memisahkan data pasien dari pemeriksaan agar identitas pasien tidak dicatat berulang.
2. Memisahkan data dokter dari pemeriksaan agar informasi dokter dikelola pada satu tabel.
3. Memisahkan resep dan detail resep agar satu resep dapat memiliki beberapa jenis obat.
4. Menghubungkan pembayaran dengan pemeriksaan menggunakan no_pemeriksaan sebagai FK.
5. Menambahkan detail pembayaran untuk mencatat setiap item layanan atau obat yang dibayarkan.
6. Menghubungkan tabel petugas dengan pembayaran jika identitas kasir perlu dicatat.
Perubahan ini perlu diterapkan pada ERD proyek jika struktur sebelumnya belum memiliki pemisahan tersebut. Kardinalitas dan aturan keunikan harus tetap mengikuti aturan bisnis yang berlaku.