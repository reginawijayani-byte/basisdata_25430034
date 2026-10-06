# Dokumen Kebutuhan Data

## 1. Latar belakang dan aktivitas organisasi
Klinik pratama sehat RAW merupakan klinik yang melayani pemeriksaan kesehatan untuk pasien umum. kegiatan di klinik meliputi pendaftaran pasien, pemeriksaan oleh dokter, pencatatan hasil pemeriksaan, pemberian resep obat, pembayaran, dan pengelolaan stok obat. selama proses tersebut, klinik membutuhkan data pasien, dokter, jadwal pemeriksaan, rekam medis, obat, resep dan pembayaran. data tersebut perlu dicatat dengan rapi supaya petugas lebih mudah mencari informasi dan riwayat pasien juga tetep tersimpan dengan baik.

## 2. Aktor dan proses bisnis
| Kode | Proses bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | pendaftaran pasien | petugas pendaftaran | pasien datang untuk berobat |
| PB-02 | pemeriksaan pasien | dokter | pasien sudah terdaftar |
| PB-03 | pemberian resep obat | dokter | pemeriksaan pasien selesai |
| PB-04 | pembayaran pasien | kasir | pemeriksaan dan resep selesai |

## 3. Dokumen sumber yang dianalisis
Dokumen sumber yang digunakan dalam proyek ini adalah formulir pendaftaran pasien, resep obat, dan bukti pembayaran. dari formulir pendaftaran bisa bisa didapat data seperti nomer pasien, nama,tanggal lahir,alamat,dan nomer hp. dari rekaman mendis bisa diketahui tanggal pemeriksaan,dokter,keluhan,hasil pemeriksaan,diagnosis, dan tindakan. sementara itu, resep digunakan untuk mencatat obatyang diberikan kepada pasien dan bukti pembayaran digunakan untuk mencatat biaya pemeriksaan maupun obat.

## 4. Entitas kandidat dan elemen data
| Entitas kandidat | Elemen data utama | Sumber |
|---|---|---|
| pasien | no_pasien,NIK,nama,tanggal lahir,jenis kelamin,alamat, no_hp | formulir pendaftaran |
| dokter | id_dokter,nama,spesialisasi,no_str,no_hp | data dokter |
| pemeriksaan | no_pemeriksaan,tanggal,pasien,dokter,keluhan,diagnosis,tindakan | rekam medis |
| resep | no_resep,no_pemeriksaan,tanggal | resep dokter |
| detail resep | no_resep,obat,jumlah,aturan_pakai | resep dokter |
| obat | kode_obat,nama_obat,kategori,stok,harga | data obat |
| pembayaran | no_pembayaran,pemeriksaan,tanggal,total,metode_bayar | bukti pembayaran |
| petugas | id-petugas,nama,bagian | data petugas |

## 5. Aturan bisnis
| Kode | Aturan bisnis |
|---|---|
| AB-01 | setiap pasien memiliki nomer pasien yang unik |
| AB-02 | satu pasien bisa melakukan pemeriksaan lebih dari satu kali |
| AB-03 | setiap pemeriksaan harus memiliki pasien dan dokter yang menangani |
| AB-04 | hasil pemeriksaa dan diagnosis harus dicatat oleh dokter setelah pemeriksaan selesai |
| AB-05 | resep hanya dapat dibuat berdasarkan pemeriksaan yang sudah dilakukan oleh dokter |
| AB-06 | jumlah obat yang diberikan tidak boleh melebihi stok obat yang tersedia |
| AB-07 | setiap pembayaran harus memiliki nomer pembayaran yang unik dan terkait dengan pemeriksaan pasien |
| AB-08 | data pasien seperti NIK dan nomer hp hanya boleh diakses oleh petugas yang memang membutuhkan data tersebut |

## 6. Kebutuhan informasi
| Kode | Kebutuhan informasi | Data yang diperlukan |
|---|---|---|
| KI-01 | menampilkan riwayat pemeriksaan pasien | pasien,pemeriksaan,dokter |
| KI-02 | menampilkan daftar pasien yang diperiksa dalam periode tertentu | pasien,pemeriksaan |
| KI-03 | menampilkan daftar obat yang stoknya sudah menipis | obat |
| KI-04 | menampilkan jumlah pendapatan klinik per hari atau per bulan | pemeriksaan,pembayaran |
| KI_05 | menampilkan jumlah pemeriksaan yang ditangani setiap dokter | dokter pemeriksaan |

## 7. Matriks CRUD
| Proses | pasien | dokter | Pemeriksaan | resep | obat | Pembayaran |
|---|---|---|---|---|---|---|
| PB-01 pendaftaran pasien | C | R | - | - | - | - |
| PB-02 pemeriksaan pasien | R | R | C | - | - | - |
| PB-03 pemberian resep | R | R | R | C | R | - |
| PB-04 pengambilan obat | R | - | R | R | R,U | - |
| PB-05 pembayaran | R | - | R | R | R | C |

## 8. Kamus data awal
| No | Elemen bahan | Keterangan | contoh | Penanggung jawab |
|---|---|---|---|---|
| 1 | n0_pasien | nomer identitas pasien | PS001 | petugas pendaftaran |
| 2 | nik_pasien | NIK pasien | 1871xxxx | petugas pendaftaran |
| 3 | nama_pasien | nama lengkap pasien | andi saputra | petugas pendaftaran |
| 4 | tanggal_lahir | tanggal lahir | 10-05-2005 | petugas pendaftaran |
| 5 | alamat_pasien | alamat tempat tinggal pasien | jl.melati | petugas pendaftaran |
| 6 | no_hp_pasien | nomer hp pasien | 0812xxxx | petugas pendaftaran |
| 7 | id_dokter | ID identitas dokter | D001 | admin klinik |
| 8 | nama_dokter | nama dokter | dr.budi | admin klinik |
| 9 | spesialis | bida dokter | umum | admin klinik |
| 10 | no_pemeriksaan | nomer pemeriksaan | PM001 | dokter |
| 11 | tanggal_pemeriksaan | tanggal pemeriksaan | 04-10-2026 | dokter |
| 12 | keluhan | keluhan yang di sampaikan pasien | demam | dokter |
| 13 | doagnosis | hasil diagnosis dokter | flu | dokter |
| 14 | no_resep | nomer resep | R001 | dokter |
| 15 | kode_obat | kode identitas obat | 0001 | petugas farmasi |
| 16 | nama_obat | nama obat | paracetamol |petugas farmasi | 
| 17 | stok_obat | jumlah stok obat | 50 | petugas farmasi |
| 18 | harga_obat | harga obat | 5000 | petugas farmasi |
| 19 | no_pembayaran | nomer pembayaran | BY001 | kasir |
| 20 | total_ pembayaran | total biaya yang harus dibayar | 50000 | kasir |

## 9. Kebutuhan non-fungsional data
### Volume
klinik diperkirakan menangani sekitar 8 pasien/transaksi per hari sebagai skala awal proyek. data akan bertambah sesuai dengan aktivitas pendaftaran,pemeriksaan,resep,obat,dan pembayaran.
### Retensi
data pasien dan riwayat pemeriksaan sebaiknya disimpan dalam jangka panjang karna bisa digunakan kembali ketika pasien datang untuk pemeriksaan berikutnya. data transaksi pembayaran dan resep juga perlu disimpan agar bisa digunakan untuk pengecekan atau laporan.
### Privasi
data seperti NIK,alamat,nomer hp,dan riwayat pemeriksaan pasien termasuk data yang perlu dijaga. data tersebut tidak boleh dilihat sebarang orang. akses data sebaiknya disesuaikan dengan tugasnya. petugas pendaftaran dapat melihat identitas pasien,dokter dapat melihat data yang diperlukan untuk pemeriksaan,petugas farmasi dapat melihat resep dan data obat,sedagkan kasih hanya melihat data yang berhubungan dengan pembayaran.
### Hak akses
| jenis data | pihak yang boleh mengakses |
|---|---|---|---|---|
| data identitas pasien | petugas pendaftaran dan pasien |
| riwayat pemeriksaan | dokter |
| diagnosis | dokter |
| data resep | dokter dan tugas farmasi |
| data obat | petugas farmasi |
| data pembayaran | kasir |
data pribadi pasien tidak boleh diakses oleh pengguna yang tidak memeiliki wewenang.

## 10. Dokumen sumber fiktif dan pembedahannya
### Formulir pendaftaran pasien
| Data	| Isi |
|---|---|---|---|---|
| No. Pasien	| PS008 |
| NIK	 | 1871xxxxxxxx |
| Nama	| Andi Saputra |
| Tanggal Lahir	| 10-05-2005 |
| Jenis Kelamin	| L |
| Alamat	| Jl. Melati |
| No. HP	| 0812xxxx |
| Tanggal Daftar	| 04-10-2026 |

### Nota pembayaran pasien 
========================================
        KLINIK SEHAT BERSAMA
           NOTA PEMBAYARAN
========================================

No. Pembayaran : BY001
No. Pasien     : PS008
Nama Pasien    : Andi Saputra
Tanggal        : 06-10-2026

----------------------------------------
Pemeriksaan Umum             Rp30.000
Paracetamol (2 tablet)       Rp10.000
----------------------------------------
TOTAL                        Rp40.000

Metode Pembayaran : Tunai

Kasir : Siti
========================================
        Terima kasih
========================================

### Pembedahan dokumen
| Data pada Nota | Elemen Data | Keterangan |
|---|---|---|---|---|
| No. Pembayaran | no_pembayaran	| Nomor unik untuk transaksi pembayaran |
| No. Pasien	| no_pasien	| Menghubungkan pembayaran dengan pasien |
| Nama Pasien	|nama_pasien	| Mengetahui identitas pasien |
| Tanggal | tanggal_pembayaran | Menyimpan tanggal transaksi \
| Pemeriksaan Umum | Data biaya pemeriksaan	| Menunjukkan biaya pelayanan |
| Paracetamol | nama_obat | Menunjukkan obat yang dibayarkan |
| Rp10.000 | harga_obat	| Harga obat |
| Rp40.000	| total_pembayaran	| Total biaya yang harus dibayar |
| Tunai	| metode_pembayaran	| Menunjukkan metode pembayaran |
| Siti	| Data kasir	| Menunjukkan petugas yang melakukan transaksi |
