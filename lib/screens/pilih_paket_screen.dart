import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/paket_model.dart' as model; // Menggunakan alias untuk menghindari konflik nama
import 'package:flutter_application_1/screens/detail_paket_screen.dart';

// Model lokal untuk data paket di halaman ini
class Paket {
  final String nama;
  final String kecepatan;
  final String harga;
  final bool isPromo;

  Paket({
    required this.nama,
    required this.kecepatan,
    required this.harga,
    this.isPromo = false,
  });
}

class PilihPaketScreen extends StatefulWidget {
  const PilihPaketScreen({super.key});

  @override
  State<PilihPaketScreen> createState() => _PilihPaketScreenState();
}

class _PilihPaketScreenState extends State<PilihPaketScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _bottomNavIndex = 0; 

  // Data untuk setiap tab
  final List<Paket> _internetPaket = [
    Paket(nama: 'Lighting', kecepatan: '10 Mbps', harga: 'Rp 166,500* / Bulan', isPromo: true),
    Paket(nama: 'Speedo', kecepatan: '20 Mbps', harga: 'Rp 231,990* / Bulan', isPromo: true),
    Paket(nama: 'Bumper', kecepatan: '30 Mbps', harga: 'Rp 276,390* / Bulan'),
    Paket(nama: 'Spark', kecepatan: '50 Mbps', harga: 'Rp 321,789* / Bulan'),
  ];

  final List<Paket> _hiburanPaket = [
    Paket(nama: 'Movie Buff', kecepatan: 'HBO, Netflix', harga: 'Rp 99,000* / Bulan'),
    Paket(nama: 'Sports Fan', kecepatan: 'beIN, Fox Sports', harga: 'Rp 120,000* / Bulan', isPromo: true),
  ];
  
  final List<Paket> _channelPaket = [
      Paket(nama: 'Basic Channels', kecepatan: '50+ Channels', harga: 'Rp 50,000* / Bulan'),
      Paket(nama: 'Premium Channels', kecepatan: '100+ Channels', harga: 'Rp 150,000* / Bulan'),
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // NOTE: Bottom Nav Bar biasanya dikelola oleh screen utama (induk)
  // untuk menghindari duplikasi seperti yang terjadi sebelumnya.
  void _onItemTapped(int index) {
    if (index != _bottomNavIndex) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

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
      backgroundColor: const Color(0xFFF9FAFB), // Warna background lebih sesuai
      appBar: AppBar(
        title: const Text(
          'Pilih Paket',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2937)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF3B82F6),
          unselectedLabelColor: Colors.grey[600],
          indicatorColor: const Color(0xFF3B82F6),
          indicatorWeight: 3.0,
          tabs: const [
            Tab(text: 'Internet'),
            Tab(text: 'Hiburan'),
            Tab(text: 'Channel'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPaketList(_internetPaket),
          _buildPaketList(_hiburanPaket),
          _buildPaketList(_channelPaket),
        ],
      ),
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
          selectedItemColor: const Color(0xFF3B82F6),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildPaketList(List<Paket> paketList) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: paketList.length,
      itemBuilder: (context, index) {
        final paket = paketList[index];
        return _PaketCard(paket: paket);
      },
    );
  }
}

class _PaketCard extends StatelessWidget {
  const _PaketCard({required this.paket});

  final Paket paket;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // NAVIGASI: Pindah ke DetailPaketScreen dengan membawa data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPaketScreen(
              // Konversi dari model lokal ke model bersama
              paket: model.Paket(
                title: paket.nama,
                speed: paket.kecepatan,
                price: paket.harga,
                isPromo: paket.isPromo,
                description: '(Paket Internet ${paket.nama} dengan kecepatan ${paket.kecepatan} berlangganan selama 1 Bulan)'
              ),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9CA3AF).withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paket.nama,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Broadband UpTo | ${paket.kecepatan}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4B5563),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        paket.harga,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B82F6),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/lightning-bolt.png',
                  width: 36,
                  height: 36,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            if (paket.isPromo) const _PromoTag(),
          ],
        ),
      ),
    );
  }
}

class _PromoTag extends StatelessWidget {
  const _PromoTag();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -16, 
      right: -16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: const Text(
          'Promo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
