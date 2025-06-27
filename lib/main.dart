import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import splash screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelantik Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', // Anda bisa menambahkan font custom di sini
      ),
      home: const SplashScreen(), // Mengatur SplashScreen sebagai halaman awal
      debugShowCheckedModeBanner: false,
    );
  }
}
