import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart'; // Pastikan file ini ada di proyek Anda

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data untuk setiap halaman onboarding
  final List<Map<String, String>> _pageData = [
    {
      "image": "assets/images/Pebble.png", // Pastikan path gambar ini benar
      "title": "Hidupkan Setiap Detik",
      "subtitle": "We are here ready serve you order 24 hour nonstop so you can enjoy your holidays.",
    },
    {
      "image": "assets/images/Wormies.png", // Pastikan path gambar ini benar
      "title": "Dengan Kecepatan Terbaik",
      "subtitle": "Do whatever you like and we protect your data from various threats.",
    }
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2FE), // Warna biru muda untuk background
      body: Stack(
        children: [
          // Bagian atas dengan gambar dan teks
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _pageData.length,
            itemBuilder: (context, index) {
              return Container(
                // Memberi padding agar gambar tidak terlalu ke atas dan ada ruang untuk kartu
                padding: const EdgeInsets.only(bottom: 250, top: 100), 
                alignment: Alignment.center,
                child: Image.asset(
                  _pageData[index]['image']!,
                  height: 250,
                ),
              );
            },
          ),
          // Tombol Skip di kanan atas
          Positioned(
            top: 50.0,
            right: 20.0,
            child: TextButton(
              onPressed: _navigateToLogin,
              child: const Text('Skip', style: TextStyle(color: Colors.black54, fontSize: 16)),
            ),
          ),
          // Kartu putih di bagian bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 320, // Sedikit menambah tinggi kartu untuk layout yang lebih baik
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _pageData[_currentPage]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _pageData[_currentPage]['subtitle']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 50), // Menambah jarak ke tombol
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: _pageData.length,
                          effect: const WormEffect(
                            spacing: 12,
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: Colors.black12,
                            activeDotColor: Color(0xFF3B82F6),
                          ),
                        ),
                        // REVISI: Menggunakan GestureDetector karena aset gambar sudah berupa tombol
                        GestureDetector(
                          onTap: () {
                            if (_currentPage == _pageData.length - 1) {
                              _navigateToLogin();
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Image.asset(
                            'assets/images/Next.png', // Menggunakan aset gambar tombol yang sudah jadi
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
