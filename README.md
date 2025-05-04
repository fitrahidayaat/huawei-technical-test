# Huawei Technical Test

Aplikasi ini terdiri dari 3 komponen utama:
1. Frontend - Aplikasi formulir kontak
2. Backend - REST API untuk mengelola data formulir
3. Automation Scripts - Skrip pengumpulan dan pembersihan data otomatis
4. Data Processing - Sebuah file SQL berisi jawaban dari pertanyaan 1-5 pada instruksi

## Cara Menjalankan

### Backend Service
1. Buka direktori backend:
```bash
cd pengembangan-backend
```
2. Install dependensi:
```bash
npm install
```
3. Jalankan dalam mode development:
```bash
npm run dev
```
Server backend akan berjalan di http://localhost:3000

### Frontend Application
1. Frontend sudah terintegrasi dengan backend dan akan otomatis terbuka di http://localhost:3000
2. Untuk pengembangan frontend:
- File HTML/CSS/JS utama berada di direktori public/
- Lakukan perubahan file dan browser akan otomatis merefresh

### Automation Scripts
1. Buka direktori automation:
```bash
cd automation-testing
```
2. Berikan hak akses eksekusi ke skrip:
```bash
chmod +x *.sh
```
3. Setup cron jobs:
```bash
./setup.sh
```

Skrip akan berjalan otomatis sesuai jadual:

- collect_data.sh - Pengumpulan data pukul 08:00, 12:00, dan 15:00
- cleanup_data.sh - Pembersihan data setiap tengah malam

> Catatan: Bagian Automation Scripts hanya dapat dijalankan pada sistem operasi Linux/MacOS.