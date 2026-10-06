# Dokumen Kebutuhan Data - Kopma

## 1. Latar belakang dan aktivitas organisasi
Jadi organisasi ini tuh bergerak di bidang koperasi kampus yang melayani aktifitas akademik buat beli alat tulis, makanan ringan, dan minuman sehari-hari. Aktivitas utamanya meliputi pendaftaran anggota baru, melayani transaksi penjualan di kasir, mengecek persedian stok barang di gudang, melakukan pemesanan stik ke pemasok kalo barang udah menipis, sampai menyusun laporan omzet bulanan buat pengurus.

## 2. Aktor dan proses bisnis
| Kode | Proses bisnis | Aktor terlibat | Pemicu kegiat |
|---|---|---|---|
| PB-01 | Mendaftarkan anggota | Kasir (atas permintaan mahasiswa) | Mahasiswa ingin menjadi anggota |
| PB-02 | Mencatat penjualan | Kasir | Pembeli membayar di kasir |
| PB-03 | Memesan barang ke pemasok | Petugas gudang | Stok di bawah batas minimum |
| PB-04 | Menerima barang dari pemasok | Petugas gudang | Barang datang bersama faktur |
| PB-05 | Menyusun laporan bulanan | Ketua koperasi | Awal bulan |

## 3. Dokumen sumber yang dianalisis
Dokumen yang dianalisis adalah nota penjualan kopma. Dari nota tersebut bisa diketahui bebrapa data penting seperti nomer nota, tanggal dan waktu transaksi, kasir, anggota, barang, jumlah barang, harga saat transaksi, dan jumlah pembayaran. Selain nota penjualan, data pemasok dan barang juga bisa diperoleh dari daftar barang, faktur pemasok, dan hasil wawancara dengan petugas. Beberapa data seperti subtotal dan total merupakan nilai yang bisa dihitung dari data lain. Jadi tidak semua angka yang ada di nota harus menjadi data yang berdiri sendiri.

## 4. Entitas kandidat dan elemen data
| Entitas kandidat | Elemen data utama | Sumber |
|---|---|---|
| Anggota | nomor anggota, NIM, nama, program studi, nomor HP, status aktif, poin royalitas | Formulir pendaftaran |
| Barang | kode, nama, kategori, harga jual, stok, batas minimum stok | Daftar barang, faktur |
| Penjualan | nomor nota, tanggal-jam, kasir, anggota (opsional), bayar | Nota penjualan |
| Detail penjualan | nomor nota, barang, qty, harga saat transaksi | Nota penjualan |
| Petugas | kode petugas, nama, peran (kasir/gudang/ketua) | Wawancara |
| Pemasok | kode, nama, telepon, alamat | Faktur pemasok |
| Pembelian dan detailnya | nomor faktur, tanggal, pemasok, barang, qty, harga beli | faktur pemasok |

## 5. Aturan bisnis
| Kode | Aturan bisnis |
|---|---|
| AB-01 | Setiap nota memiliki nomor unik dan minimal satu baris barang. |
| AB-02 | Penjualan boleh tanpa anggota (pembeli umum); jika ada, anggota harus berstatus aktif untuk memperoleh diskon 5%. |
| AB-03 | Stok barang tidak boleh negatif; penjualan ditolak bila qty melebihi stok tersedia. |
| AB-04 | Harga jual yang dipakai pada nota disimpan per baris dan tidak berubah meski harga barang kemudian naik. |
| AB-05 | NIM anggota unik; pencarian anggota dapat dilakukan lewat nomor anggota atau NIM. |
| AB-06 | Pesanan pembelian dibuat bila stok kurang dari batas minimum barang tersebut. |
| AB-07 | setiap kelipatan Rp.10000 belanja anggota bernilai 1 poin loyalitas |
| AB-08 | setiap 50 poin loyalitas dapat ditukar dengan potongan Rp.5000 |

## 6. Kebutuhan informasi
| Kode | Kebutuhan informasi | Data yang diperlukan |
|---|---|---|
| KI-01 | Omzet dan jumlah nota per hari dan per bulan | Penjualan, detail penjualan |
| KI-02 | Lima barang terlaris per bulan berdasarkan qty | Detail penjualan, barang |
| KI-03 | Barang dengan stok di bawah batas minimum | Barang |
| KI-04 | Sepuluh anggota dengan belanja terbesar per bulan | Penjualan, detail penjualan, anggota |
| KI-05 | mengetahui jumlah poin loyalitas setiap anggota | penjualan, detail penjualan, anggota |

## 7. Matriks CRUD
| Proses | Anggota | Barang | Penjualan | Detail Penjualan | Pemasok | Pembelian |
|---|---|---|---|---|---|---|
| PB-01 daftar anggota | c | ... | ... | ... | ... | ... |
| PB-02 catat penjualan | R,U | R,U | C | C | ... | ... |
| PB-03 pesan kepemasok | ... | R | ... | ... | R | C |
| PB-04 terima barang  | ... | U | ... | ... | R | U |
| PB-05 laporan bulanan | R | R | R | R | ... | R |

## 8. Kamus data awal
| Elemen | Arti | Contoh | Aturan | Penanggung jawab |
|---|---|---|---|---|
| no_anggota | Nomor anggota koperasi | A-0457 | Unik, format A-4 digit | Ketua |
| nim_anggota | NIM anggota | 2301010123 | Unik, 10 digit | Ketua |
| no_hp_anggot a | Nomor HP anggota | 0812xxxx | Data pribadi, akses terbatas | ketua |
| no_nota_penj ualan | Nomor nota penjualan | PJ-2609-0142 | Unik per nota | Kasir |
| harga_satuan _detail_penj ualan | Harga jual saat transaksi | 4000 | Bilangan bulat ≥ 0(rupiah) | Kasir |
| stok_barang | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 (AB-03) | Petugas gudang |

## 9. Kebutuhan non-fungsional data
### Volume
Perkiraan transaksi masuk sekitar 150 nota per hari ditambah data log barang harian.
### Retensi
Riwaya data transaksi penjual wajib disimpan minimal selama 5 tahun ke belakang buat keperluan audit.
### Privasi
Data nomen handphone dan identitas pribadi anggota bersifat rahasia, jadi aksesnya dibatasi hanya untuk ketua dan tidak boleh di umbar ke kasir.

## 10. Isu kualitas data yang diantisipasi
1. stok barang bisa menjadi negatif kalaujumlah penjualan tidak di cek terlebh dahulu.
2. harga pada transaksi lama bisa salah kalau sistem hanya bisa mengambil harga terbaru dari tabel barang.
3. NIM anggota bisa tercatat lebih dari satu kali kalau tidak dibuat aturan unik.
4. data anggota bisa sulit ditemukan kalo nomer anggota atau NIM tidak dicatat dengan benar.
5. data pemasok bisa tidak teratur kalo tidak ada proses khusus untuk mengelolanya.
6. data pribadi anggota bisa tersebar kalo aksesnya tidak dibatasi.