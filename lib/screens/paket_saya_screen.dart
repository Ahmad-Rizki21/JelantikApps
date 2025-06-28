import 'package:flutter/material.dart';

class PaketSayaScreen extends StatefulWidget {
  const PaketSayaScreen({super.key});

  @override
  State<PaketSayaScreen> createState() => _PaketSayaScreenState();
}

class _PaketSayaScreenState extends State<PaketSayaScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _bottomNavIndex = 0; // State untuk Bottom Navigation Bar

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
    if (index != _bottomNavIndex) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  // Widget helper untuk membuat item navigasi, sama seperti di MainScreen
  BottomNavigationBarItem _buildNavItem(String iconPath, String label, int index) {
    final bool isSelected = _bottomNavIndex == index;
    final Color color = isSelected ? const Color(0xFF3B82F6) : Colors.grey;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: ImageIcon(
          AssetImage(iconPath),
          color: color,
        ),
      ),
      label: label,
    );
  }


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
            fontSize: 20, // Sedikit memperbesar font agar lebih menonjol
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
          // Konten untuk tab "Aktif"
          _buildAktifTab(),
          // Placeholder untuk tab "Terjadwal"
          const Center(
            child: Text('Tidak ada paket yang dijadwalkan.'),
          ),
        ],
      ),
      // REVISI: Menambahkan BottomNavigationBar yang sama dengan MainScreen
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            _buildNavItem('assets/images/Home.png', 'Home', 0),
            _buildNavItem('assets/images/History.png', 'History', 1),
            _buildNavItem('assets/images/Pesan.png', 'Pesan', 2),
            _buildNavItem('assets/images/Settings.png', 'Settings', 3),
          ],
          currentIndex: _bottomNavIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
        ),
      ),
    );
  }

  // Widget untuk membangun konten tab "Aktif"
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
               color: Colors.black.withOpacity(0.30),
               blurRadius: 50,
               spreadRadius: 1,
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
            // REVISI: Membuat seluruh teks deskripsi menjadi tebal
           const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)), // Gaya default
                children: <TextSpan>[
                  TextSpan(
                    text: 'Broadband UpTo | 10 Mbps',
                    style: TextStyle(fontWeight: FontWeight.bold), // Bagian yang tebal
                  ),
                  TextSpan(text: ' | 1 Bulan'), // Bagian yang tidak tebal
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
                      // REVISI: Memastikan teks tombol tebal
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
