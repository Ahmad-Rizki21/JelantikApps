import 'package:flutter/material.dart';
// 1. Impor widget navigasi kustom Anda
import 'package:flutter_application_1/widgets/custom_bottom_navigation.dart'; 
// Impor MainScreen untuk navigasi kembali
import 'package:flutter_application_1/screens/main_screen.dart'; 

class PaketSayaScreen extends StatefulWidget {
  const PaketSayaScreen({super.key});

  @override
  State<PaketSayaScreen> createState() => _PaketSayaScreenState();
}

class _PaketSayaScreenState extends State<PaketSayaScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // State untuk Bottom Navigation Bar, di halaman ini Home (indeks 0) selalu aktif
  final int _bottomNavIndex = 0; 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  // Method untuk menangani tap pada item navigasi bawah
  void _onItemTapped(int index) {
    // Navigasi kembali ke MainScreen. 
    // Idealnya, gunakan state management (Provider, Bloc, dll.) untuk memberitahu
    // MainScreen agar pindah ke tab yang sesuai dengan `index` yang diklik.
    // Untuk saat ini, kita hanya kembali ke tumpukan navigasi awal.
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainScreen()),
      (route) => false,
    );
  }

  // Hapus _buildNavItem karena sudah ada di dalam CustomBottomNavigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 120, 253),
        elevation: 0,
        centerTitle: true, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Paket Saya',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 4.0,
          labelColor: Colors.white,
          // ignore: deprecated_member_use
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          tabs: const [
            Tab(text: 'Aktif'),
            Tab(text: 'Terjadwal'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAktifTab(),
          const Center(
            child: Text('Tidak ada paket yang dijadwalkan.'),
          ),
        ],
      ),
      // 2. Gunakan widget kustom yang sudah dibuat
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _bottomNavIndex, // Indeks 'Home'
        onTap: _onItemTapped,
      ),
    );
  }

  // Widget untuk membangun konten tab "Aktif" (tidak berubah)
  Widget _buildAktifTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Speed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Broadband UpTo | 10 Mbps',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' | 1 Bulan'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Sekali Berlangganan',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerRight
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Jadwalkan',
                    style: TextStyle(
                      color: Color(0xFF3B82F6),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
