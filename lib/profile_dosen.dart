import 'package:flutter/material.dart';

import 'daftar_dosen.dart';
import 'notifikasi.dart';
import 'package:kelompok3/profile_dosen.dart';

class DosenProfilePages extends StatelessWidget {
  const DosenProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFD0DFFF),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/daftardosen');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/notif');// Aksi untuk notifikasi
            },
          ),
          PopupMenuButton<int>(
            icon: Icon(Icons.person, color: Colors.black),
            onSelected: (value) {
              switch (value) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/profile');
                  break;
                case 1:
                // Navigate to password change page
                  Navigator.pushReplacementNamed(context, '/ganti_pw');
                  break;
                case 2:
                // Handle logout
                  Navigator.pushReplacementNamed(context, '/login');
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Profile"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.lock, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Ganti Password"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, size: 50),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/edit_profile');
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.blueAccent,
                              child: const Icon(Icons.edit, size: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Dr. John Doe',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const Text(
                      'Dosen Pengajar Prodi Teknologi Informasi',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const SectionTitle(title: 'Tentang'),
              const Text(
                'Dr. John Doe adalah dosen tetap di Jurusan Teknologi Informasi, Politeknik Negeri Malang. Beliau memiliki pengalaman lebih dari 10 tahun dalam bidang Teknologi Informasi dan memiliki minat khusus dalam pengembangan perangkat lunak dan kecerdasan buatan.',
                textAlign: TextAlign.justify, // Meratakan teks
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Pendidikan'),
              const Text(
                'S1: Teknik Informatika, Universitas ABC \nS2: Magister Teknologi Informasi, Universitas DEF \nS3: Doktor Ilmu Komputer, Universitas GHI.',
                textAlign: TextAlign.justify, // Meratakan teks
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Bidang Keahlian'),
              const Text(
                'Pengembangan Perangkat Lunak, Kecerdasan Buatan, Sistem Informasi, dan Teknologi Web.',
                textAlign: TextAlign.justify, // Meratakan teks
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: 'HKI dan Produk Unggulan'),
              const Text(
                'Beliau memiliki beberapa HKI yang terkait dengan algoritma optimasi dan aplikasi mobile. Produk unggulan yang dihasilkan adalah aplikasi manajemen tugas dan sistem rekomendasi berbasis AI.',
                textAlign: TextAlign.justify, // Meratakan teks
              ),
              const SizedBox(height: 24),

              // Bagian Sertifikasi dengan warna latar belakang
              const SectionTitle(title: 'Sertifikasi'),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CertificationCard(title: 'Sertifikasi Pemrograman Dart', certificateNumber: 'DART123456', date: 'Januari 2024'),
                    CertificationCard(title: 'Sertifikasi Pengembangan Aplikasi Mobile', certificateNumber: 'APP987654', date: 'Maret 2023'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Bagian Pelatihan dengan warna latar belakang
              const SectionTitle(title: 'Pelatihan'),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CertificationCard(title: 'Pelatihan AI untuk Pemula', certificateNumber: 'AI123456', date: 'Agustus 2023'),
                    CertificationCard(title: 'Workshop Flutter dan Dart', certificateNumber: 'FLUTTER789', date: 'November 2023'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Rekomendasi Dosen Lain'),
              const SizedBox(height: 16),
              // Bagian rekomendasi dosen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedDosenCard(
                    name: 'Dr. Jane Smith',
                    specialty: 'Jaringan Komputer',
                  ),
                  ElevatedDosenCard(
                    name: 'Dr. Richard Roe',
                    specialty: 'Keamanan Siber',
                  ),
                  ElevatedDosenCard(
                    name: 'Dr. Emily Davis',
                    specialty: 'Data Science',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class CertificationCard extends StatelessWidget {
  final String title;
  final String certificateNumber;
  final String date;

  const CertificationCard({
    required this.title,
    required this.certificateNumber,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nomor Sertifikat: $certificateNumber'),
            Text('Tanggal: $date'),
          ],
        ),
        trailing: SizedBox(
          width: 100, // Atur lebar sesuai kebutuhan
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Ubah padding untuk ukuran tombol
              backgroundColor: const Color(0xFF3D63DD), // Warna tombol
            ),
            onPressed: () {
              // Aksi untuk bukti sertifikat
            },
            child: const Text(
              'Bukti Sertifikat',
              style: TextStyle(
                fontSize: 10, // Ukuran font tombol lebih kecil
                color: Colors.white, // Warna teks putih
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedDosenCard extends StatelessWidget {
  final String name;
  final String specialty;

  const ElevatedDosenCard({required this.name, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // Elevasi untuk membuat efek timbul
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Membuat sudut lebih tumpul
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 100, // Lebar kotak rekomendasi dosen
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFD0DFFF),
              child: Icon(Icons.person, size: 30),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12, // Ukuran font lebih kecil
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              specialty,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10), // Ukuran font lebih kecil
            ),
          ],
        ),
      ),
    );
  }
}
