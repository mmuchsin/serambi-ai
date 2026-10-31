# serambi.ai prototype (Netlify)

Mockup UI/UX statis. Tidak ada akun, database, atau backend.

- `index.html`: landing page
- `app/index.html`: prototipe satu file (Beranda, Belajar, Latihan, Kemajuan, Tanya AI)
- `assets/`: tangkapan layar untuk landing
- `netlify.toml`: publish dan header dasar

## Status jujur

- Semua angka, soal, dan profil pengguna adalah contoh.
- Tanya AI memakai jawaban contoh. Kode hanya memanggil `claude.use('sample')` bila runtime
  menyediakannya. Di Netlify runtime itu tidak ada, jadi selalu memakai jawaban contoh.
- Rencana 6 minggu di sini belum terhubung ke flow `goal_decomposer` (Langflow) yang masih
  menghasilkan 12 minggu. Penyelarasan ada di future works.
- 14 materi: 4 materi awal bersumber dari satu panduan resmi Anthropic, 10 materi lain
  memuat rujukan makalah ilmiah.

## Deploy

Zip isi folder ini (bukan folder induknya), lalu Netlify > Deploy manually > seret zip.
Tanpa build command.
