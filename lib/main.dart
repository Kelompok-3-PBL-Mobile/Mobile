import 'package:flutter/material.dart';
import 'package:kelompok3/gantipw.dart';

import 'login.dart';
import 'profile_dosen.dart';
import 'daftar_dosen.dart';
import 'sidebar.dart';
import 'notifikasi.dart';
import 'upload.dart';
import 'pengajuangagal.dart';
import 'pengajuanberhasil.dart';
import 'editprofile.dart';

String url_domain = "http://192.168.67.19:8000/";
String url_l1ogin = url_domain + "api/login";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kel 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD0DFFF)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPages(),
        '/daftardosen': (context) => DaftarDosenPages(),
        '/profile': (context) => const DosenProfilePages(),
        '/sidebar': (context) => const SideBar(),
        '/notif': (context) => NotificationPages(),
        '/upload': (context) => UploadSertifPages(),
        '/gagal' : (context) => const PengajuanGagalPages(),
        '/berhasil' : (context) => const PengajuanBerhasilPages(),
        '/edit_profile' : (context) => const EditProfileDosen(),
        '/ganti_pw' : (context) => const GantiPasswordPage(),
      },
    );
  }
}