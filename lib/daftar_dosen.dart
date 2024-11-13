import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'notifikasi.dart';
import 'upload.dart';

class DaftarDosenPages extends StatelessWidget {
  DaftarDosenPages({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dosenList = [
      {'name': 'Dr. John Doe', 'specialty': 'Kecerdasan Buatan'},
      {'name': 'Prof. Jane Smith', 'specialty': 'Sistem Informasi'},
      // Add other lecturers here
    ];

    return Scaffold(
      key: _scaffoldKey, // Gunakan GlobalKey untuk scaffold
      appBar: AppBar(
        backgroundColor: Color(0xFFD6E4FF),
        title: Text(
          'DAFTAR DOSEN',
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
        child: Column(
          children: [
            const Text(
              'Daftar Dosen JTI Polinema',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: dosenList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final dosen = dosenList[index];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFD0DFFF),
                          child: Icon(Icons.person, size: 40),
                        ),
                        const SizedBox(height: 8),
                        Text(dosen['name'] ?? ''),
                        Text(dosen['specialty'] ?? ''),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
