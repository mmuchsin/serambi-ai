# Operasional, Inventori & Keuangan dengan AI untuk UMKM

> Modul 4 dari 4 — khusus pemilik UMKM & e-commerce

## Tujuan Pembelajaran

Setelah modul ini, kamu bisa:
1. Menggunakan AI untuk pengelolaan inventori & stok
2. Membuat laporan keuangan sederhana dengan AI
3. Mengotomatiskan tugas administrasi operasional

## 1. Pengelolaan Inventori

### Prompt untuk Tracking Stok

```
Buatkan template spreadsheet untuk tracking stok [JENIS PRODUK] dengan kolom:
- Nama produk
- Stok awal
- Terjual
- Stok sisa
- Reorder point (kapan harus restock)
- Supplier
- Harga beli
- Harga jual
- Margin

Sertakan formula Excel untuk: stok sisa, margin, dan alert reorder.
```

### Prompt untuk Forecasting Stok

```
Berdasarkan data penjualan 3 bulan terakhir:
[DATA PENJUALAN]

Prediksi stok yang dibutuhkan untuk bulan depan.
Sertakan: produk yang perlu restock, jumlah restock, dan alasan.
```

### Tips Inventori UMKM

1. **FIFO (First In, First Out)** — jual yang lama dulu
2. **Reorder point** — set alert saat stok < 20% dari rata-rata penjualan mingguan
3. **ABC analysis** — fokus pada 20% produk yang menghasilkan 80% revenue
4. **Gunakan spreadsheet** — Google Sheets gratis, cukup untuk UMKM

### Latihan 1

Buat template tracking stok untuk produkmu.

## 2. Laporan Keuangan Sederhana

### Prompt untuk Laporan Keuangan

```
Buatkan template laporan keuangan bulanan untuk UMKM [JENIS USAHA].
Sertakan:
- Pemasukan (per kategori)
- Pengeluaran (per kategori: bahan baku, operasional, marketing, lainnya)
- Laba/rugi bersih
- Cash flow
- Perbandingan bulan ini vs bulan lalu
Format: tabel + ringkasan naratif.
```

### Prompt untuk Analisis Keuangan

```
Analisis data keuangan UMKM berikut:
[DATA KEUANGAN]

Sertakan:
- Tren pemasukan/pengeluaran
- Produk paling menguntungkan
- Area penghematan
- Rekomendasi untuk bulan depan
```

### Latihan 2

Buat laporan keuangan 1 bulan untuk usahamu.

## 3. Otomatisasi Administrasi

### Tugas yang Bisa Diotomatiskan dengan AI

| Tugas | Alat AI | Waktu Hemat |
|-------|---------|-------------|
| Invoice & kwitansi | ChatGPT + template | 30 mnt → 5 mnt |
| Laporan penjualan | Excel AI / Sheets | 1 jam → 10 mnt |
| Email ke supplier | ChatGPT | 15 mnt → 3 mnt |
| Deskripsi produk | ChatGPT | 10 mnt → 2 mnt |
| Jadwal posting | Buffer/Hootsuite AI | 30 mnt → 5 mnt |

### Prompt untuk Invoice

```
Buatkan template invoice untuk UMKM [NAMA TOKO] dengan:
- Header: nama toko, alamat, kontak
- Detail: nomor invoice, tanggal, nama pelanggan
- Tabel: produk, qty, harga satuan, total
- Footer: total, metode pembayaran, ucapan terima kasih
Format: siap cetak (text-based).
```

### Latihan 3

Buat 3 template: invoice, laporan penjualan harian, email ke supplier.

## 4. Tools AI untuk Operasional UMKM

| Kebutuhan | Alat | Kegunaan |
|-----------|------|----------|
| Spreadsheet | Google Sheets + AI | Tracking stok, keuangan, penjualan |
| Invoice | Wave / Invoice Ninja | Invoice otomatis + tracking |
| Accounting | Xero / QuickBooks AI | Pembukuan otomatis |
| Inventory | Shopify / WooCommerce | Tracking stok e-commerce |
| Scheduling | Google Calendar + AI | Jadwal posting, pengiriman |

## 5. Tips & Pitfalls

### ✅ Tips
- Mulai dengan spreadsheet sederhana, upgrade ke tools berbayar jika perlu
- Backup data secara berkala (Google Drive)
- Gunakan AI untuk analisis, bukan untuk input data — kamu yang input, AI yang analisis

### ❌ Pitfalls
- Jangan percaya 100% pada prediksi AI — gunakan sebagai referensi, bukan keputusan final
- Jangan input data keuangan ke AI publik — privasi!
- Jangan over-engineer — UMKM kecil cukup dengan spreadsheet

## Latihan Akhir

1. Buat template tracking stok
2. Buat laporan keuangan 1 bulan
3. Buat 3 template administrasi (invoice, laporan harian, email supplier)
4. Pilih 1 alat operasional dan setup

## Sumber
- Shopify AI: https://www.shopify.com/ai
- Xero AI Accounting: https://www.xero.com/ai-accounting/
- QuickBooks AI: https://quickbooks.intuit.com/ai/