# Dokumen Ekspor-Impor dengan AI

> Modul 1 dari 4 — khusus staff ekspor-impor & bea cukai

## Tujuan Pembelajaran

Setelah modul ini, kamu bisa:
1. Membuat dokumen ekspor (invoice, packing list, certificate of origin) dengan AI
2. Menggunakan AI untuk review & validasi dokumen
3. Mengotomatiskan penerjemahan dokumen bisnis

## 1. Dokumen Ekspor Utama

### Daftar Dokumen Ekspor

| Dokumen | Fungsi | Kapan Dibutuhkan |
|---------|--------|-----------------|
| Commercial Invoice | Bukti transaksi jual-beli | Setiap pengiriman |
| Packing List | Detail isi kemasan | Setiap pengiriman |
| Certificate of Origin (COO) | Bukti asal barang | Untuk preferensi tarif |
| Bill of Lading (B/L) | Bukti pengiriman laut | Pengiriman laut |
| Air Waybill (AWB) | Bukti pengiriman udara | Pengiriman udara |
| Customs Declaration | Deklarasi bea cukai | Semua pengiriman |

### Prompt untuk Commercial Invoice

```
Buatkan template Commercial Invoice untuk ekspor dengan:
- Header: nama exporter, alamat, kontak, nomor invoice, tanggal
- Buyer: nama importer, alamat, negara
- Detail: deskripsi barang, HS code, quantity, unit price, total value
- Shipping: metode pengiriman, port of loading, port of discharge
- Payment terms: [LC/TT/DP]
- Incoterms: [FOB/CIF/EXW/etc]
Format: siap cetak, profesional.
```

### Prompt untuk Packing List

```
Buatkan template Packing List untuk ekspor dengan:
- Header: exporter, importer, nomor invoice terkait
- Detail per koli: nomor koli, deskripsi, quantity, berat (kg), dimensi (cm), volume (m3)
- Total: total koli, total berat, total volume
- Catatan: handling instructions (fragile, keep dry, etc)
```

### Latihan 1

Buat template Commercial Invoice dan Packing List untuk produkmu.

## 2. Review & Validasi Dokumen dengan AI

### Prompt untuk Review Dokumen

```
Review dokumen ekspor berikut untuk potensi kesalahan:
[DOKUMEN]

Cek:
1. Konsistensi data (nama, alamat, jumlah harus sama di semua dokumen)
2. HS code sesuai dengan deskripsi barang
3. Incoterms konsisten di semua dokumen
4. Nilai total sesuai (quantity × unit price = total)
5. Tanggal dan nomor referensi

Berikan: daftar temuan + rekomendasi perbaikan.
```

### Contoh Review

**Temuan AI:**
- ⚠️ HS code di invoice (8517.12) tidak sesuai deskripsi "smartphone" → seharusnya 8517.12.00
- ⚠️ Total value: 100 unit × $50 = $5,000, tapi tertulis $5,500 → selisih $500
- ✅ Nama buyer konsisten di semua dokumen
- ✅ Incoterms FOB konsisten

### Latihan 2

Review 3 dokumen ekspor dengan AI dan catat temuan.

## 3. Terjemahan Dokumen Bisnis

### Prompt untuk Terjemahan

```
Terjemahkan dokumen bisnis berikut dari [BAHASA ASAL] ke [BAHASA TUJUAN].
Pertahankan format dan struktur asli.
Gunakan terminologi bisnis yang tepat.
Jangan terjemahkan: nama perusahaan, alamat, nomor referensi, HS code.
[DOKUMEN]
```

### Tips Terjemahan Dokumen

1. **Gunakan DeepL** untuk terjemahan awal (lebih akurat dari Google Translate untuk bisnis)
2. **Review dengan AI** — minta AI cek konsistensi terminologi
3. **Simpan glossary** — kumpulkan istilah bisnis yang sering digunakan
4. **Jangan terjemahkan otomatis** untuk kontrak hukum — gunakan penerjemah tersumpah

### Latihan 3

Terjemahkan 1 dokumen ekspor (invoice atau packing list) ke bahasa Inggris.

## 4. HS Code & Klasifikasi

### Prompt untuk Klasifikasi HS Code

```
Bantu klasifikasi HS code untuk produk: [DESKRIPSI PRODUK].
Sertakan:
- HS code yang mungkin (3-5 opsi)
- Penjelasan mengapa code tersebut sesuai
- Tarif bea masuk rata-rata untuk code tersebut
- Catatan: verifikasi dengan bea cukai setempat
```

### Tips HS Code

1. **Jangan percaya 100% pada AI** — selalu verifikasi dengan bea cukai
2. **Gunakan Trade Map** (trademap.org) untuk referensi
3. **Konsultasi dengan customs broker** untuk produk kompleks
4. **Simpan database HS code** yang sering digunakan

## 5. Tips & Pitfalls

### ✅ Tips
- Buat template sekali, gunakan berkali-kali
- Gunakan AI untuk review, bukan untuk membuat dokumen dari nol (untuk dokumen legal)
- Simpan semua dokumen dalam 1 folder terstruktur

### ❌ Pitfalls
- Jangan input data sensitif (nomor rekening, password) ke AI
- Jangan gunakan AI untuk dokumen legal tanpa review ahli
- Jangan asumsikan AI tahu regulasi terbaru — selalu verifikasi

## Latihan Akhir

1. Buat template Commercial Invoice dan Packing List
2. Review 3 dokumen ekspor dengan AI
3. Terjemahkan 1 dokumen ke bahasa Inggris
4. Klasifikasi HS code untuk 3 produk

## Sumber
- Trade.gov Export Documents: https://www.trade.gov/export-documents
- ICC Incoterms 2020: https://iccwbo.org/resources-library/incoterms-2020/
- WTO Services: https://www.wto.org/english/tratop_e/serv_e/serv_e.htm
- Bea Cukai Indonesia: https://www.beacukai.go.id/