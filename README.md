# 🎮 Katalog Game Flutter (UTS Pemrograman Mobile)

Aplikasi katalog game interaktif berbasis **Flutter** dan **Dart** yang menyajikan informasi game populer, filter kategori, spesifikasi sistem minimum (*Minimum System Requirements*), serta galeri *screenshot*. Didevelop untuk memenuhi tugas **Ujian Tengah Semester (UTS) Pemrograman Mobile**.

---

## 👤 Informasi Mahasiswa
* **Nama:** Muhammad Abdul Rochim
* **NIM:** 240605110179
* **Program Studi:** Teknik Informatika 2024 - UIN Maulana Malik Ibrahim Malang

---

## ✨ Fitur Utama
- **🎨 Steam Dark Neon Theme:** Antarmuka modern bertema *Midnight Navy* (`#0E141D`) dengan aksen *Electric Cyan Glow* (`#00D2FF`).
- **🔍 Real-Time Search Bar:** Pencarian game secara langsung berdasarkan judul atau genre di halaman Beranda.
- **🏷️ Filter Kategori/Genre:** Tombol filter interaktif untuk kategori *Menembak (Shooter)*, *Balap (Racing)*, *Strategi (Strategy)*, dan *Sport (Sports)*.
- **🔥 Game Populer Carousel:** Slider horizontal untuk menampilkan koleksi game unggulan.
- **📋 Game Terbaru List:** Daftar vertikal game terbaru yang dilengkapi detail singkat dan tombol navigasi langsung.
- **📱 Halaman Katalog Lengkap:** Menampilkan seluruh koleksi game menggunakan `ListView.builder`.
- **💻 Detail & Minimum System Requirements:** Informasi rinci spesifikasi hardware minimum (OS, Processor, Memory, Graphics, Storage).
- **🖼️ Galeri Screenshot Interaktif:** Scroll horizontal gambar tangkapan layar game (*in-game screenshot*).
- **📖 Expandable Description:** Teks deskripsi game yang dapat dipotong dan diperluas menggunakan `ReadMoreText`.
- **⚡ Fallback Network/Offline:** Pengambilan data live via *FreeToGame API* dengan *fallback* otomatis ke `assets/data/games.json` jika koneksi terputus.
- ## 📱 Tampilan Aplikasi

### Halaman Beranda
![Beranda](screenshots/home.png)

### Pencarian & Filter Kategori
![Search](screenshots/search.png)

### Detail Game & System Requirements
![Detail](screenshots/detail.png)

---

## 🏗️ Struktur Arsitektur (MVVM)
Proyek ini disusun secara modular mengikuti pola **Model-View-ViewModel (MVVM)**:

```text
lib/
├── model/
│   ├── game.dart          # Class model data utama game
│   └── detailgame.dart    # Class model detail game, requirements, & screenshot
├── viewmodel/
│   └── fetchgame.dart     # Service HTTP API & pengolahan fallback JSON lokal
├── view/
│   ├── home.dart          # Halaman Beranda (Search & Category Filter)
│   ├── list_game.dart     # Halaman Koleksi Katalog Lengkap
│   └── detail.dart        # Halaman Detail Game & System Requirements
└── main.dart              # Entry point & Konfigurasi Named Routes
