# Chatbot & Layanan Pelanggan dengan AI untuk UMKM

> Modul 3 dari 4 — khusus pemilik UMKM & e-commerce

## Tujuan Pembelajaran

Setelah modul ini, kamu bisa:
1. Membuat chatbot sederhana untuk WhatsApp/IG
2. Membuat template respons pelanggan dengan AI
3. Menggunakan AI untuk analisis feedback pelanggan

## 1. Chatbot Sederhana

### Alur Chatbot UMKM

```
Pelanggan kirim pesan → Chatbot respon otomatis → Jika kompleks, forward ke owner
```

### Template Respons Chatbot

**Prompt untuk membuat template:**
```
Buatkan 10 template respons untuk chatbot UMKM [JENIS USAHA].
Kategori: sapaan, info produk, harga, cara order, pengiriman, komplain, promo, FAQ, ucapan terima kasih, penutup.
Tone: ramah, profesional, tidak robotik.
Panjang: max 3 kalimat per template.
Sertakan placeholder [NAMA], [PRODUK], [HARGA].
```

### Contoh Template

| Kategori | Template |
|----------|----------|
| Sapaan | "Halo [NAMA]! 👋 Selamat datang di [NAMA TOKO]. Ada yang bisa kami bantu hari ini?" |
| Info Produk | "Produk [PRODUK] tersedia dengan harga [HARGA]. Stok: [STOK]. Mau order?" |
| Cara Order | "Untuk order: 1) Pilih produk, 2) Kirim alamat, 3) Transfer ke [REKENING], 4) Kirim bukti transfer. Mudah kan? 😊" |
| Pengiriman | "Pengiriman via [KURIR], estimasi [X] hari. Tracking: [LINK]" |
| Komplain | "Mohon maaf atas ketidaknyamanan, [NAMA]. Kami akan segera tindak lanjuti. Bisa ceritakan lebih detail?" |

### Latihan 1

Buat 10 template respons untuk tokomu.

## 2. Tools Chatbot untuk UMKM

| Alat | Platform | Harga | Kegunaan |
|------|----------|-------|----------|
| Tidio | Web/IG/WA | Free tier | Chatbot + live chat |
| Intercom Fin | Web | Berbayar | AI agent canggih |
| WhatsApp Business API | WA | Berbayar | Auto-reply + catalog |
| ManyChat | IG/FB/WA | Free tier | Flow builder |
| Chatbase | Web | Free tier | Chatbot dari dokumen |

### Tips Memilih Chatbot

1. **Mulai dengan WhatsApp Business** (gratis, cukup untuk UMKM kecil)
2. **Gunakan auto-reply** untuk pertanyaan umum (harga, jam buka, alamat)
3. **Forward ke manusia** untuk komplain atau pertanyaan kompleks
4. **Update template** setiap bulan berdasarkan pertanyaan yang sering muncul

## 3. Analisis Feedback Pelanggan

### Prompt untuk Analisis Review

```
Analisis 10 review pelanggan berikut untuk UMKM [JENIS USAHA]:
[LIST REVIEW]

Sertakan:
- Sentimen keseluruhan (positif/negatif/netral)
- 3 tema utama yang disebutkan
- 2 hal yang perlu diperbaiki
- 1 hal yang sudah baik
- Rekomendasi tindakan
```

### Contoh Analisis

**Review:**
1. "Kue enak tapi pengiriman lama" → Negatif (pengiriman)
2. "Rasa mantap, harga worth it" → Positif
3. "Packaging kurang rapi" → Negatif (packaging)

**Hasil Analisis:**
- Sentimen: Mixed (60% positif, 40% negatif)
- Tema utama: rasa (positif), pengiriman (negatif), packaging (negatif)
- Perbaikan: optimasi logistik, upgrade packaging
- Sudah baik: rasa produk
- Rekomendasi: investasi di packaging dan kurir yang lebih cepat

### Latihan 2

Kumpulkan 10 review/pesan pelanggan, analisis dengan AI.

## 4. FAQ Otomatis

### Prompt untuk FAQ

```
Buatkan FAQ untuk UMKM [JENIS USAHA] dengan 10 pertanyaan yang paling sering ditanyakan pelanggan.
Format: Q: [pertanyaan] A: [jawaban singkat, max 2 kalimat].
Kategori: produk, harga, order, pengiriman, pembayaran, komplain.
```

## 5. Tips & Pitfalls

### ✅ Tips
- Chatbot untuk pertanyaan umum, manusia untuk komplain
- Update template berdasarkan pertanyaan baru
- Gunakan AI untuk draft, kamu untuk finalisasi dengan "suara brand"

### ❌ Pitfalls
- Jangan buat chatbot yang terlalu "robotik" — gunakan emoji dan bahasa hangat
- Jangan biarkan chatbot menangani komplain serius tanpa eskalasi ke manusia
- Jangan lupa cek chatbot secara berkala — update info produk/harga

## Latihan Akhir

1. Buat 10 template respons chatbot
2. Pilih 1 alat chatbot dan setup
3. Analisis 10 review pelanggan
4. Buat FAQ 10 pertanyaan

## Sumber
- Tidio: https://www.tidio.com/ai-chatbot/
- Intercom Fin: https://www.intercom.com/features/fin-ai-agent
- ManyChat: https://manychat.com/