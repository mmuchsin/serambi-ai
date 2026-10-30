# Prompt Engineering untuk Guru

> Modul 1 dari 5 — khusus guru SD/SMP/SMA/SMK

## Tujuan Pembelajaran

Setelah modul ini, kamu bisa:
1. Menulis prompt efektif untuk membuat RPP, soal, dan materi ajar
2. Menggunakan teknik "few-shot" untuk hasil yang konsisten
3. Menyesuaikan output AI dengan kurikulum merdeka

## 1. Prompt untuk RPP (Rencana Pelaksanaan Pembelajaran)

### Template Prompt RPP

```
Kamu adalah guru [JENJANG] berpengalaman dengan [X] tahun mengajar.
Buatkan RPP untuk mata pelajaran [MAPEL], kelas [KELAS], tema [TEMA].
Durasi: [MENIT] menit.
Kurikulum: Merdeka.

Format output (tabel):
| Komponen | Deskripsi |
|----------|-----------|
| Tujuan Pembelajaran | ... |
| Profil Pelajar Pancasila | ... |
| Kegiatan Awal (5 menit) | ... |
| Kegiatan Inti (30 menit) | ... |
| Kegiatan Penutup (10 menit) | ... |
| Penilaian | ... |
| Sumber Belajar | ... |
```

### Contoh Nyata

**Prompt:**
> Kamu adalah guru SD kelas 3 berpengalaman. Buatkan RPP IPA tema "Tumbuhan Hijau" untuk kurikulum merdeka, 45 menit, 30 siswa. Format tabel dengan kolom: tujuan, kegiatan awal (5 mnt), kegiatan inti (30 mnt), penutup (10 mnt), penilaian.

**Hasil (ringkasan):**
- Tujuan: Siswa dapat mengidentifikasi bagian tumbuhan dan fungsinya
- Kegiatan inti: Observasi daun dengan lup, diskusi kelompok, presentasi
- Penilaian: Observasi + lembar kerja

### Latihan 1

Buat RPP untuk mata pelajaranmu sendiri. Gunakan template di atas.

**Hint:** Mulai dengan mata pelajaran yang paling sering kamu ajar. Jangan lupa sertakan jumlah siswa dan durasi.

## 2. Teknik "Few-Shot" untuk Konsistensi

Few-shot = memberikan contoh sebelum meminta AI membuat output baru.

### Contoh Few-Shot untuk Soal

**Prompt:**
> Berikut contoh soal IPA kelas 3 (kurikulum merdeka):
> 
> Soal 1 (C1): Sebutkan 3 bagian tumbuhan yang dapat kamu lihat!
> Soal 2 (C2): Jelaskan fungsi akar bagi tumbuhan!
> Soal 3 (C3): Bandingkan daun tumbuhan yang hidup di tempat teduh vs terang!
> 
> Sekarang buatkan 3 soal serupa untuk tema "Hewan dan Habitatnya", kelas 3, dengan level kognitif yang sama (C1, C2, C3).

**Kenapa ini efektif:** AI belajar dari pola contohmu, sehingga output konsisten dengan gaya soalmu.

### Latihan 2

Buat 2 contoh soal dari mata pelajaranmu, lalu minta AI membuat 3 soal baru dengan pola yang sama.

## 3. Prompt untuk Diferensiasi

**Diferensiasi** = menyesuaikan materi untuk siswa dengan kemampuan berbeda.

### Template Prompt Diferensiasi

```
Buatkan 3 versi [TUGAS/MATERI] untuk topik [TOPIK], kelas [KELAS]:
- Versi A (siswa yang butuh tantangan lebih): [kriteria]
- Versi B (siswa rata-rata): [kriteria]
- Versi C (siswa yang butuh dukungan): [kriteria]
```

### Contoh

> Buatkan 3 versi soal IPA "Tumbuhan" kelas 3:
> - Versi A (siswa advanced): soal HOTS dengan analisis
> - Versi B (siswa rata-rata): soal aplikasi sederhana
> - Versi C (siswa yang butuh dukungan): soal dengan scaffolding dan gambar

## 4. Tips Khusus Guru

1. **Selalu review output AI** sebelum diberikan ke siswa
2. **Sesuaikan dengan kurikulum merdeka** — AI tidak tahu kurikulum terbaru secara otomatis
3. **Gunakan bahasa Indonesia** yang sesuai usia siswa
4. **Tambahkan konteks lokal** — contoh dari lingkungan siswa (misal: tumbuhan di sekitar sekolah)
5. **Jangan copy-paste mentah** — personalisasi dengan gaya mengajarmu

## Latihan Akhir

1. Buat 1 RPP lengkap menggunakan template prompt di atas
2. Buat 3 soal dengan teknik few-shot
3. Buat 1 set soal diferensiasi (3 versi)

## Sumber
- Prompting Guide (Pendidikan): https://www.promptingguide.ai/applications/education
- Microsoft Education AI: https://education.microsoft.com/en-us/resources/ai-in-education
- TeachAI: https://teachai.org/