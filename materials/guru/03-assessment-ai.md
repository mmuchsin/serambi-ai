# Soal, Rubrik & Penilaian dengan AI

> Modul 3 dari 5 — khusus guru SD/SMP/SMA/SMK

## Tujuan Pembelajaran

Setelah modul ini, kamu bisa:
1. Membuat soal dari C1 (ingat) sampai C6 (mencipta) dengan AI
2. Membuat rubrik penilaian yang konsisten
3. Menggunakan AI untuk feedback otomatis pada jawaban siswa

## 1. Soal Berbasis Taksonomi Bloom

### Prompt untuk Soal Multi-Level

```
Buatkan 6 soal untuk topik [TOPIK], kelas [KELAS]:
- 2 soal C1 (ingat/mengingat)
- 2 soal C2 (memahami/menjelaskan)
- 1 soal C3 (menerapkan/menggunakan)
- 1 soal C4 (menganalisis/membedakan)
Format: soal + kunci jawaban + rubrik singkat.
```

### Contoh: Soal IPA "Tumbuhan" Kelas 3

**C1 (Ingat):** Sebutkan 3 bagian utama tumbuhan!
**C2 (Memahami):** Jelaskan fungsi akar bagi tumbuhan!
**C3 (Menerapkan):** Buatlah diagram sederhana proses fotosintesis!
**C4 (Menganalisis):** Bandingkan daun tumbuhan yang hidup di tempat teduh vs terang!

### Latihan 1

Buat 6 soal untuk mata pelajaranmu dengan distribusi C1-C4 menggunakan prompt di atas.

## 2. Rubrik Penilaian

### Template Prompt Rubrik

```
Buatkan rubrik penilaian untuk [JENIS TUGAS] topik [TOPIK], kelas [KELAS].
Kriteria: [KRITERIA 1], [KRITERIA 2], [KRITERIA 3].
Skala: 1-4 (1=perlu bimbingan, 4=sangat baik).
Format: tabel dengan deskriptor tiap level.
```

### Contoh Rubrik: Presentasi IPA

| Kriteria | 1 (Perlu Bimbingan) | 2 (Cukup) | 3 (Baik) | 4 (Sangat Baik) |
|----------|---------------------|-----------|----------|-----------------|
| Isi Materi | Tidak akurat | Sebagian akurat | Akurat | Akurat + contoh |
| Penyampaian | Tidak jelas | Kurang jelas | Jelas | Jelas + menarik |
| Visual | Tidak ada | Sederhana | Relevan | Sangat relevan |

### Latihan 2

Buat rubrik untuk 1 jenis tugas di mata pelajaranmu.

## 3. Feedback Otomatis dengan AI

### Prompt untuk Feedback Jawaban Siswa

```
Kamu adalah guru [MAPEL] yang suportif.
Berikut jawaban siswa kelas [KELAS] untuk soal: "[SOAL]"
Jawaban siswa: "[JAWABAN SISWA]"

Berikan feedback yang:
1. Mengapresiasi usaha siswa
2. Menjelaskan apa yang benar
3. Memberikan hint untuk bagian yang salah (tanpa memberikan jawaban langsung)
4. Mendorong siswa untuk mencoba lagi
```

### Contoh Feedback

**Soal:** Jelaskan fungsi akar bagi tumbuhan!
**Jawaban siswa:** "Akar untuk menyerap air"

**Feedback AI:**
> "Bagus! Kamu sudah benar bahwa akar menyerap air. 🌱 Coba pikirkan lagi: selain air, apa lagi yang diserap akar dari tanah? Dan bagaimana akar membantu tumbuhan tetap berdiri? Coba jawab lagi dengan menambahkan 1-2 poin lagi!"

### Latihan 3

Ambil 3 jawaban siswa (anonim) dan buat feedback dengan AI.

## 4. Kuis Adaptif

### Prompt untuk Kuis Adaptif

```
Buatkan kuis 5 soal untuk topik [TOPIK], kelas [KELAS].
Level: [PEMULA/SEDANG/LANJUT].
Setiap soal: pertanyaan + 4 pilihan + kunci + penjelasan.
Jika siswa salah, berikan hint (bukan jawaban) untuk mencoba lagi.
```

## 5. Tips & Pitfalls

### ✅ Tips
- Gunakan AI untuk generate soal, tapi selalu review sebelum diberikan
- Simpan bank soal yang sudah di-review untuk reuse
- Gunakan few-shot untuk konsistensi gaya soal

### ❌ Pitfalls
- Jangan gunakan soal AI tanpa review — bisa ada kesalahan faktual
- Jangan buat soal terlalu mudah/sulit — sesuaikan dengan level siswa
- Jangan lupa cek kesesuaian dengan kurikulum

## Latihan Akhir

1. Buat 6 soal (C1-C4) untuk mata pelajaranmu
2. Buat 1 rubrik penilaian
3. Buat feedback untuk 3 jawaban siswa
4. Buat 1 kuis adaptif 5 soal

## Sumber
- Edutopia Formative Assessment: https://www.edutopia.org/article/ai-tools-formative-assessment
- TeachAI: https://teachai.org/
- ISTE Assessment: https://www.iste.org/areas-of-focus/ai-in-education