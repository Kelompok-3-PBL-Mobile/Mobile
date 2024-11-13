import 'package:flutter/material.dart';

class PengajuanBerhasilPages extends StatelessWidget {
  const PengajuanBerhasilPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/daftardosen');
          },
        ),
        title: Center(
          child: Text(
            "LIHAT PENGAJUAN",
            style: TextStyle(color: Colors.black),
          ),
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Text("Foto", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            Text(
              "John Doe - Nama Dosen",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Pengajar Prodi",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Informasi Sertifikasi yang Diajukan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(""),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Rekomendasi atau saran",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Diisi rekomendasi atau saran oleh Pimpinan jurusan. "
                    "Diisi rekomendasi atau saran oleh Pimpinan jurusan.",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Pengajuan Disetujui",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "“Kami dengan ini menyetujui pengajuan sertifikasi yang Anda ajukan. Silakan melanjutkan proses pendaftaran sesuai dengan prosedur yang berlaku.”",
              style: TextStyle(color: Colors.green[700]),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text("Kembali"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
