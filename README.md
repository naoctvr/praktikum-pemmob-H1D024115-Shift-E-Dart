# Belajar Flutter
> Aplikasi Latihan Pemrograman Mobile Menggunakan Flutter dan Dart

---

## 👤 Identitas Praktikan
- **Nama Lengkap:** Nayla Octavia Ramadhani
- **NIM:** H1D024115
- **Shift Awal:** I
- **Shift Akhir:** E

---

## 📱 Deskripsi Aplikasi

Belajar Flutter merupakan proyek latihan mata kuliah Pemrograman Mobile yang dikembangkan menggunakan framework Flutter dan bahasa pemrograman Dart. Proyek ini mencakup pembelajaran bertahap dari dasar pembuatan antarmuka (widget & layouting), sistem navigasi dan routing, menu samping (side menu/drawer), autentikasi login, penyimpanan lokal (*local storage*) menggunakan `shared_preferences`, hingga perancangan arsitektur data model dan antarmuka operasi CRUD (*Create, Read, Update, Delete*).

Aplikasi ini dikembangkan menggunakan Android Studio dan dapat dijalankan pada perangkat Android, Emulator, maupun Web Browser (Chrome).

---

## 🛠️ Penjelasan Teknis

### 1. Spesifikasi dan Tech Stack

- **Framework:** Flutter (Channel stable)
- **Bahasa Pemrograman:** Dart
- **IDE:** Android Studio / VS Code
- **Flutter SDK:** `D:\flutter`
- **Target Perangkat:** Android & Web
- **UI Framework:** Material Design
- **Dependencies Utama:**
  - `cupertino_icons: ^1.0.8` (Ikonografi Cupertino/iOS style)
  - `shared_preferences: ^2.0.17` (Penyimpanan data lokal / Local Storage)

### 2. Fitur Utama Berdasarkan Modul

#### 🔹 Modul 2: Dasar Widget & Layout
- **Hello World:** Menampilkan teks sederhana menggunakan widget `Text`, `Center`, `Scaffold`, dan `AppBar`.
- **Column:** Menyusun beberapa widget secara vertikal ke bawah.
- **Row:** Menyusun beberapa widget secara horizontal ke samping.
- **Form Produk Dasar:** Menerima input kode produk, nama produk, dan harga produk.
- **Detail Produk Dasar:** Menampilkan data produk yang dikirimkan dari form.
- **ListView Produk:** Menampilkan daftar item produk menggunakan widget `ListView`, `Card`, dan `ListTile`.

#### 🔹 Modul 3: Routes, Side Menu, Login & Local Storage
- **Halaman Login:** Form autentikasi username & password (simulasi akun `admin`/`admin`).
- **Penyimpanan Lokal (Local Storage):** Menggunakan `shared_preferences` untuk menyimpan session username pengguna secara persisten pada perangkat.
- **Dialog & Navigasi Route:** Menampilkan notifikasi popup dialog (`AlertDialog`) setelah login dan berpindah halaman menggunakan `Navigator.push` / `MaterialPageRoute`.
- **Halaman Utama (Home Page):** Membaca kembali data username dari `SharedPreferences` dan menampilkannya pada UI (*"Ini adalah halaman User [namauser]"*).
- **Side Menu (Drawer):** Menu samping dengan header *"Sidemenu"* dan opsi navigasi menuju halaman **Home** serta **About**.
- **Halaman About:** Halaman informasi tambahan yang terintegrasi dengan Side Menu.

#### 🔹 Modul 4: Operasi CRUD (Model Data & UI Toko Kita)
- **Data Modeling (`lib/model/`):**
  - `Produk`: Atribut `id`, `kodeProduk`, `namaProduk`, `hargaProduk`, serta method `fromJson`.
  - `Login`: Atribut `code`, `status`, `token`, `userID`, `userEmail`, serta method `fromJson`.
  - `Registrasi`: Atribut `code`, `status`, `data`, serta method `fromJson`.
- **Halaman Registrasi (`registrasi_page.dart`):** Form pendaftaran akun lengkap dengan validasi komprehensif:
  - Validasi panjang karakter nama (minimal 3 karakter).
  - Validasi email (wajib diisi & validasi format Regular Expression).
  - Validasi password (minimal 6 karakter & `obscureText`).
  - Validasi konfirmasi password (pencocokan dengan input password).
- **Halaman Login Toko (`ui/login_page.dart`):** Form login dengan validasi email dan password serta tautan navigasi langsung ke halaman Registrasi.
- **Form Produk Dual-Mode (`produk_form.dart`):** Form fleksibel dengan deteksi otomatis mode operasi:
  - Mode Tambah: Judul *"TAMBAH PRODUK"* dengan tombol submit *"SIMPAN"*.
  - Mode Ubah/Edit: Judul *"UBAH PRODUK"* dengan tombol submit *"UBAH"* dan input textfield terisi otomatis dengan data produk yang dipilih.
- **Detail Produk (`produk_detail.dart`):** Menampilkan detail kode, nama, dan harga produk beserta dua aksi utama:
  - Tombol **EDIT** untuk mengarahkan pengguna ke form dalam mode ubah.
  - Tombol **DELETE** yang dilengkapi dengan dialog konfirmasi konfirmasi penghapusan data.
- **Daftar Produk (`produk_page.dart`):** Menampilkan daftar katalog produk menggunakan `ListView` & `Card`, tombol tambah produk (**+**) pada AppBar, drawer dengan menu Logout, dan interaksi tap untuk membuka detail produk.

---

### 3. Struktur Direktori Proyek

```text
belajarflutter/
├── android/
├── ios/
├── lib/
│   ├── main.dart                  # File utama (Entry point aplikasi)
│   │
│   # Modul 2 - Dasar Widget
│   ├── hello_world.dart           # Latihan Hello World
│   ├── column_widget.dart         # Latihan Widget Column
│   ├── row_widget.dart            # Latihan Widget Row
│   │
│   # Modul 3 - Routes, Side Menu, Login & Local Storage
│   ├── login_page.dart            # Halaman Login (Simulasi & SharedPreferences)
│   ├── home_page.dart             # Halaman Home (Menampilkan data user tersimpan)
│   ├── sidemenu.dart              # Komponen Side Menu (Drawer Navigasi)
│   ├── about_page.dart            # Halaman About
│   │
│   # Modul 4 - Operasi CRUD (Model & UI)
│   ├── model/                     # Data Model
│   │   ├── login.dart             # Model Login & Parsing JSON
│   │   ├── produk.dart            # Model Produk & Parsing JSON
│   │   └── registrasi.dart        # Model Registrasi & Parsing JSON
│   └── ui/                        # Antarmuka Pengguna Modul 4
│       ├── login_page.dart        # Halaman Login Toko Kita
│       ├── registrasi_page.dart   # Halaman Registrasi Akun
│       ├── produk_page.dart       # Halaman List Produk (Katalog)
│       ├── produk_detail.dart     # Halaman Detail Produk & Aksi
│       └── produk_form.dart       # Form Produk (Tambah & Edit)
├── test/
├── pubspec.yaml                   # Konfigurasi dependensi Flutter
├── pubspec.lock
└── README.md
```

---

## 📸 Tangkapan Layar

### Modul 2 — Dasar Widget & Layout
| Hello World | Column | Row | Form Produk | Detail Produk | Daftar Produk |
|:---:|:---:|:---:|:---:|:---:|:---:|
| <img width="120" src="https://github.com/user-attachments/assets/86e9c790-60e4-476e-8f51-1aabe2ca92c0" /> | <img width="120" src="https://github.com/user-attachments/assets/10a64453-9d8e-4134-8810-3590e39d1732" /> | <img width="120" src="https://github.com/user-attachments/assets/75fefef2-7ed3-4290-9385-c449945ab96f" /> | <img width="120" src="https://github.com/user-attachments/assets/9e6270ba-f7fa-4068-afe0-efa1a03b88f6" /> | <img width="120" src="https://github.com/user-attachments/assets/431e9c89-d5c5-4f36-88e9-ee22d07103b6" /> | <img width="120" src="https://github.com/user-attachments/assets/f8fb583c-0546-4ff0-bbb5-cd4aa5040193" /> |

### Modul 3 — Routes, Side Menu, Login & Local Storage
| Login Modul 3 | Home Page (User Admin) | Side Menu (Drawer) |
|:---:|:---:|:---:|
| <img width="235" height="519" alt="WhatsApp Image 2026-11-17 at 14 31 16" src="https://github.com/user-attachments/assets/963f47dd-519a-4f75-8458-1ac89232c0ba" /> | <img width="238" height="525" alt="WhatsApp Image 2026-11-17 at 14 32 07" src="https://github.com/user-attachments/assets/6d31ad4b-3466-4468-ad9b-20a2261e8dea" /> | <img width="231" height="524" alt="WhatsApp Image 2026-11-17 at 14 32 42" src="https://github.com/user-attachments/assets/040de4aa-42fb-494f-a432-a34a7ef1b032" />

### Modul 4 — Operasi CRUD Toko Kita
| List Produk | Detail Produk | Form Tambah Produk | Form Ubah Produk | Dialog Konfirmasi Hapus | Login Toko Kita | Registrasi Akun |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| <img width="248" height="553" alt="image" src="https://github.com/user-attachments/assets/f6c21394-fe73-4d7e-a5d1-3557ba2c2ddb" /> | <img width="250" height="554" alt="image" src="https://github.com/user-attachments/assets/193ebbcf-3d8a-4c87-b8d7-20a589d0eba3" /> | <img width="249" height="551" alt="image" src="https://github.com/user-attachments/assets/9c00cb63-56d6-49bf-b962-c09a6ff0c2f8" /> | <img width="249" height="553" alt="image" src="https://github.com/user-attachments/assets/39b2eb15-bec6-4796-b870-16c1bf56d111" /> | <img width="252" height="553" alt="image" src="https://github.com/user-attachments/assets/21bc1956-713c-414c-a13c-ec55d3a7ab1a" /> | <img width="251" height="555" alt="image" src="https://github.com/user-attachments/assets/d2b756b4-d21b-4f92-b1a6-c03fe4701f36" /> | <img width="249" height="551" alt="image" src="https://github.com/user-attachments/assets/d7d0e9f2-64d9-45a6-a4a7-786babe0eaca" /> |

---

## 🚀 Cara Menjalankan Proyek

### 1. Prasyarat

- Android Studio / VS Code
- Flutter SDK (terkonfigurasi pada environment path, misal: `D:\flutter`)
- Android SDK & Build Tools
- Plugin Flutter dan Dart pada IDE
- Perangkat Android dengan USB Debugging aktif, Emulator, atau Google Chrome

### 2. Langkah Menjalankan

1. Buka folder project `belajarflutter` di Android Studio atau VS Code.
2. Buka terminal pada folder project.
3. Unduh seluruh dependensi proyek dengan menjalankan:
   ```bash
   flutter pub get
   ```
4. Cek perangkat yang tersedia:
   ```bash
   flutter devices
   ```
5. Jalankan aplikasi pada perangkat yang dipilih:
   ```bash
   # Menjalankan pada perangkat Android
   flutter run

   # Atau menjalankan pada Web Chrome
   flutter run -d chrome
   ```

### 3. Memilih Modul yang Ingin Dijalankan

Untuk berganti tampilan modul pada saat aplikasi pertama kali dibuka, ubah properti `home` pada file `lib/main.dart`:

- **Menjalankan Modul 3 (Login & Side Menu):**
  ```dart
  import 'package:flutter/material.dart';
  import 'package:belajarflutter/login_page.dart';

  void main() => runApp(const MaterialApp(home: LoginPage()));
  ```

- **Menjalankan Modul 4 (List Produk Toko Kita):**
  ```dart
  import 'package:flutter/material.dart';
  import 'package:belajarflutter/ui/produk_page.dart';

  void main() => runApp(const MaterialApp(home: ProdukPage()));
  ```

- **Menjalankan Modul 4 (Login & Registrasi Toko Kita):**
  ```dart
  import 'package:flutter/material.dart';
  import 'package:belajarflutter/ui/login_page.dart';

  void main() => runApp(const MaterialApp(home: LoginPage()));
  ```
