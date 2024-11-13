import 'package:flutter/material.dart';

import 'sidebar.dart';
import 'notifikasi.dart';
import 'profile_dosen.dart';

class UploadSertifPages extends StatelessWidget {
  UploadSertifPages({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Gunakan GlobalKey untuk scaffold
      appBar: AppBar(
        backgroundColor: Color(0xFFD6E4FF),
        title: Text(
          'UPLOAD SERTIF',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Buka drawer saat ikon ditekan
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/notif');
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
          IconButton(
            icon: Icon(Icons.file_copy, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/upload');
            },
          ),
        ],
        elevation: 0,
      ),
      drawer: SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300], // Placeholder for the image
              child: Icon(Icons.photo, size: 50, color: Colors.white), // Placeholder photo icon
            ),
            SizedBox(height: 16),
            Text(
              "John Doe - Nama Dosen",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Pengajar Prodi",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Judul Sertifikasi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Deskripsi terkait Sertifikasi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Tanggal mulai - Tanggal berakhir',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Jenis Sertifikasi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nomer Sertifikat',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Border untuk area upload
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload, size: 50, color: Colors.black),
                        Text('Upload Bukti Sertifikat')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40), // Tambahkan jarak antara form dan tombol
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Fungsi batal
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Tombol batal warna merah
                  ),
                  child: Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Fungsi upload
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Tombol upload warna hijau
                  ),
                  child: Text('Upload'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
