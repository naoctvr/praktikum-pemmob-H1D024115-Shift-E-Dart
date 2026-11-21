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

Belajar Flutter merupakan proyek latihan mata kuliah Pemrograman Mobile yang dikembangkan menggunakan framework Flutter dan bahasa pemrograman Dart. Proyek ini mencakup pembelajaran komprehensif mulai dari dasar widget dan layouting, routing dan side menu, autentikasi sesi dengan local storage, perancangan arsitektur antarmuka dan data model CRUD, hingga **integrasi penuh ke REST API backend (CodeIgniter 4)** menggunakan pola BLoC (*Business Logic Component*), HTTP client, dan dialog feedback kustom.

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
- **Backend API:** CodeIgniter 4 RESTful API & MySQL Database (`toko_api`)
- **Dependencies Utama:**
  - `cupertino_icons: ^1.0.8` (Ikonografi Cupertino/iOS style)
  - `shared_preferences: ^2.0.17` (Penyimpanan data lokal / Local Storage)
  - `http: ^1.1.0` (Komunikasi dan request HTTP ke RESTful API)

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
- **Form Produk Dual-Mode (`produk_form.dart`):** Form fleksibel dengan deteksi otomatis mode operasi (Tambah vs Ubah).
- **Detail Produk (`produk_detail.dart`):** Menampilkan detail kode, nama, dan harga produk beserta aksi EDIT dan DELETE.
- **Daftar Produk (`produk_page.dart`):** Menampilkan daftar katalog produk, tombol tambah (+), drawer dengan logout, dan interaksi tap ke detail produk.

#### 🔹 Modul 5: Integrasi REST API & Helper Modul
- **Helper & Utility (`lib/helpers/`):**
  - `UserInfo`: Mengelola penyimpanan token otentikasi Bearer dan User ID di local storage secara asinkron.
  - `AppException`: Sistem penanganan error jaringan terpusat (`FetchDataException`, `BadRequestException`, `UnauthorisedException`, dll).
  - `Api`: Wrapper HTTP client untuk method `GET`, `POST`, dan `DELETE` yang otomatis menyertakan header authorization token.
  - `ApiUrl`: Konfigurasi terpusat alamat endpoint REST API backend.
- **Business Logic Component (`lib/bloc/`):**
  - `RegistrasiBloc`: Menangani request pendaftaran akun baru ke endpoint `/registrasi`.
  - `LoginBloc`: Menangani autentikasi login ke endpoint `/login` dan menerima token otentikasi.
  - `LogoutBloc`: Menghapus session dan token pengguna saat keluar aplikasi.
  - `ProdukBloc`: Menangani seluruh alur data produk: `getProduks()` (GET), `addProduk()` (POST), `updateProduk()` (PUT/POST), dan `deleteProduk()` (DELETE).
- **Custom Feedback Dialogs (`lib/widget/`):**
  - `SuccessDialog`: Dialog notifikasi visual saat operasi sukses (hijau).
  - `WarningDialog`: Dialog peringatan saat operasi gagal atau terjadi kesalahan (merah).
- **Integrasi Penuh ke Aplikasi:**
  - Auto-login check di `main.dart` (jika token tersimpan langsung ke `ProdukPage`, jika belum ke `LoginPage`).
  - Registrasi & Login terhubung ke server backend dengan dialog feedback interaktif.
  - `ProdukPage` mengambil data langsung dari API menggunakan `FutureBuilder`.
  - Tambah, Ubah, dan Hapus produk terhubung langsung ke database backend via REST API.

---

### 3. Struktur Direktori Proyek

```text
belajarflutter/
├── android/
├── ios/
├── lib/
│   ├── main.dart                  # File utama & auto-check session login
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
│   # Modul 4 & 5 - Data Models
│   ├── model/
│   │   ├── login.dart             # Model Login & Parsing JSON
│   │   ├── produk.dart            # Model Produk & Parsing JSON
│   │   └── registrasi.dart        # Model Registrasi & Parsing JSON
│   │
│   # Modul 5 - Helpers & Network Layer
│   ├── helpers/
│   │   ├── api.dart               # HTTP Client Wrapper (GET, POST, DELETE)
│   │   ├── api_url.dart           # Daftar Endpoint REST API
│   │   ├── app_exception.dart     # Error Handling Exception
│   │   └── user_info.dart         # Helper Session Token (SharedPreferences)
│   │
│   # Modul 5 - BLoC (Business Logic Component)
│   ├── bloc/
│   │   ├── login_bloc.dart        # BLoC Autentikasi Login
│   │   ├── logout_bloc.dart       # BLoC Logout Session
│   │   ├── produk_bloc.dart       # BLoC Operasi CRUD Produk
│   │   └── registrasi_bloc.dart   # BLoC Pendaftaran Pengguna
│   │
│   # Modul 5 - Custom Widgets
│   ├── widget/
│   │   ├── success_dialog.dart    # Dialog Notifikasi Sukses
│   │   └── warning_dialog.dart    # Dialog Notifikasi Gagal/Peringatan
│   │
│   # Antarmuka Pengguna (UI) Terintegrasi API
│   └── ui/
│       ├── login_page.dart        # Halaman Login Terintegrasi API
│       ├── registrasi_page.dart   # Halaman Registrasi Terintegrasi API
│       ├── produk_page.dart       # List Produk dari API (FutureBuilder)
│       ├── produk_detail.dart     # Detail Produk & Aksi Hapus API
│       └── produk_form.dart       # Form Tambah & Ubah Produk API
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
| <img width="120" src="https://github.com/user-attachments/assets/963f47dd-519a-4f75-8458-1ac89232c0ba" /> | <img width="120" src="https://github.com/user-attachments/assets/6d31ad4b-3466-4468-ad9b-20a2261e8dea" /> | <img width="120" src="https://github.com/user-attachments/assets/040de4aa-42fb-494f-a432-a34a7ef1b032" /> |

### Modul 4 — Operasi CRUD Toko Kita (UI Mockup)
| List Produk | Detail Produk | Form Tambah Produk | Form Ubah Produk | Dialog Konfirmasi Hapus | Login Toko Kita | Registrasi Akun |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| <img width="120" src="https://github.com/user-attachments/assets/f6c21394-fe73-4d7e-a5d1-3557ba2c2ddb" /> | <img width="120" src="https://github.com/user-attachments/assets/193ebbcf-3d8a-4c87-b8d7-20a589d0eba3" /> | <img width="120" src="https://github.com/user-attachments/assets/9c00cb63-56d6-49bf-b962-c09a6ff0c2f8" /> | <img width="120" src="https://github.com/user-attachments/assets/39b2eb15-bec6-4796-b870-16c1bf56d111" /> | <img width="120" src="https://github.com/user-attachments/assets/21bc1956-713c-414c-a13c-ec55d3a7ab1a" /> | <img width="120" src="https://github.com/user-attachments/assets/d2b756b4-d21b-4f92-b1a6-c03fe4701f36" /> | <img width="120" src="https://github.com/user-attachments/assets/d7d0e9f2-64d9-45a6-a4a7-786babe0eaca" /> |

### Modul 5 — Integrasi Penuh REST API & BLoC
| Auto-Login / Login API | Dialog Sukses Registrasi | Dialog Gagal Login | List Produk (FutureBuilder API) | Detail & Dialog Hapus API | Form Tambah ke API | Form Ubah ke API |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| <img width="120" src="" /> | <img width="120" src="" /> | <img width="120" src="" /> | <img width="120" src="" /> | <img width="120" src="" /> | <img width="120" src="" /> | <img width="120" src="" /> |

---

## 🚀 Cara Menjalankan Proyek

### 1. Prasyarat

- Android Studio / VS Code
- Flutter SDK (terkonfigurasi pada environment path, misal: `D:\flutter`)
- XAMPP (Apache & MySQL aktif untuk menjalankan REST API `toko-api`)
- Perangkat Android dengan USB Debugging aktif, Emulator, atau Google Chrome

### 2. Langkah Menjalankan

1. Pastikan web server Apache dan MySQL pada **XAMPP Control Panel** dalam keadaan **Running**.
2. Buka folder project `belajarflutter` di Android Studio atau VS Code.
3. Buka terminal pada folder project dan unduh dependensi:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi pada perangkat yang dipilih:
   ```bash
   # Menjalankan pada perangkat Android
   flutter run

   # Atau menjalankan pada Web Chrome
   flutter run -d chrome
   ```
