import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_screen.dart'; // Ganti import ke onboarding_screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        // Arahkan ke OnboardingScreen
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan background jika perlu
      body: Center(
        child: Image.asset(
          'assets/images/Jelantik_Logo.png', // Pastikan path ini benar
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
