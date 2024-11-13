import 'package:flutter/material.dart';
import 'profile_dosen.dart';
import 'notifikasi.dart';

class EditProfileDosen extends StatefulWidget {
  const EditProfileDosen({super.key});

  @override
  _EditProfileDosenState createState() => _EditProfileDosenState();
}

class _EditProfileDosenState extends State<EditProfileDosen> {
  TextEditingController namaDosenController = TextEditingController();
  TextEditingController pengajarProdiController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController pendidikanController = TextEditingController();
  TextEditingController bidangKeahlianController = TextEditingController();
  TextEditingController hkiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile Dosen'),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                //backgroundImage: AssetImage(),
                // Pastikan path sesuai dengan gambar yang tersedia
              ),
              SizedBox(height: 16),
              buildTextField('Nama Dosen', namaDosenController),
              buildTextField('Pengajar Prodi', pengajarProdiController),
              buildTextField('Deskripsi', deskripsiController, maxLines: 4),
              buildTextField('Pendidikan', pendidikanController),
              buildTextField('Bidang Keahlian', bidangKeahlianController),
              buildTextField('HKI dan Produk Unggulan', hkiController,
                  maxLines: 4),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol edit, bisa menyimpan perubahan
                      if (namaDosenController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Nama Dosen tidak boleh kosong')));
                        return;
                      }
                      // Tambahkan aksi lain untuk menyimpan data
                    },
                    child: Text('EDIT'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol hapus
                    },
                    child: Text('HAPUS'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali tanpa menyimpan
                    },
                    child: Text('BATALKAN'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}