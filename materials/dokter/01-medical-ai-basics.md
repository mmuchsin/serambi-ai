# Dasar AI dalam Kesehatan

> Modul 1 dari 3 — khusus dokter & tenaga kesehatan

## Tujuan Pembelajaran

Setelah modul ini, kamu bisa:
1. Memahami aplikasi AI dalam praktik klinis
2. Menggunakan AI untuk dokumentasi medis
3. Mengidentifikasi risiko & etika AI dalam kesehatan

## 1. AI dalam Praktik Klinis

### Aplikasi AI yang Sudah Tervalidasi

| Aplikasi | Contoh | Status |
|----------|--------|--------|
| Radiologi AI | Deteksi pneumonia di X-ray | FDA approved |
| Pathologi AI | Deteksi kanker di slide | Research → clinical |
| Dokumentasi | Speech-to-text untuk SOAP notes | Tersedia |
| Drug interaction | Cek interaksi obat otomatis | Tersedia |
| Triage AI | Prioritas pasien di IGD | Research |

### Prompt untuk Dokumentasi Klinis

```
Buatkan template SOAP note untuk pasien dengan [KELUHAN UTAMA].
Format: Subjective, Objective, Assessment, Plan.
Gunakan terminologi medis yang tepat.
Catatan: ini draft, review sebelum masuk rekam medis.
```

### Latihan 1

Buat 3 template SOAP note untuk 3 keluhan umum (demam, batuk, nyeri perut).

## 2. Risiko & Etika AI dalam Kesehatan

### Risiko Utama

| Risiko | Mitigasi |
|--------|----------|
| Halusinasi diagnosis | Selalu verifikasi dengan pemeriksaan fisik & lab |
| Bias data training | Review output untuk bias demografis |
| Privasi pasien | Jangan input data pasien ke AI publik (HIPAA/PDP) |
| Over-reliance | AI sebagai alat, bukan pengganti clinical judgment |
| Liability | Dokter tetap bertanggung jawab atas keputusan klinis |

### Aturan Emas
1. **AI adalah alat bantu, bukan pengganti clinical judgment**
2. **Jangan input data pasien** ke AI publik (ChatGPT, Claude, dll)
3. **Gunakan AI untuk dokumentasi & riset**, bukan untuk diagnosis final
4. **Verifikasi semua output** dengan pemeriksaan klinis

## 3. Tools AI untuk Dokter

| Kebutuhan | Alat | Kegunaan |
|-----------|------|----------|
| Dokumentasi | Nuance DAX, Suki | Speech-to-text untuk SOAP notes |
| Literatur | PubMed, UpToDate | Riset evidence-based |
| Drug interaction | Lexicomp, Medscape | Cek interaksi obat |
| Imaging | Aidoc, Zebra Medical | Deteksi abnormalitas radiologi |

## 4. Tips & Pitfalls

### ✅ Tips
- Gunakan AI untuk dokumentasi & riset, bukan diagnosis
- Simpan template yang berhasil untuk reuse
- Update pengetahuan AI secara berkala (model baru)

### ❌ Pitfalls
- Jangan percaya 100% pada output AI medis
- Jangan input data pasien ke AI publik
- Jangan gunakan AI untuk menggantikan clinical judgment

## Latihan Akhir

1. Buat 3 template SOAP note
2. Identifikasi 3 risiko AI yang paling relevan untuk praktikmu
3. Pilih 1 alat AI dan coba gunakan

## Sumber
- Nature AI in Medicine: https://www.nature.com/collections/ai-medicine
- The Lancet Digital Health: https://www.thelancet.com/digital-health
- AMA AI in Healthcare: https://www.ama-assn.org/delivering-care/ai-health-care