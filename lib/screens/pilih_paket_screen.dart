import 'package:flutter/material.dart';

// Model untuk data paket
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
  final int _bottomNavIndex = 0; // State untuk Bottom Navigation Bar

  // Data contoh untuk setiap tab
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
      backgroundColor: Colors.white,
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
        elevation: 0,
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
      // REVISI: Menambahkan BottomNavigationBar
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

  // Widget untuk membangun daftar paket
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

// Widget untuk kartu paket kustom
class _PaketCard extends StatelessWidget {
  const _PaketCard({required this.paket});

  final Paket paket;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // REVISI: Menggunakan warna putih agar bayangan terlihat jelas
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // REVISI: Menyesuaikan bayangan agar lebih lembut dan menyebar
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: const Color.fromARGB(255, 93, 92, 92).withOpacity(0.50),
            blurRadius: 50,
            spreadRadius: 5,
            offset: const Offset(0, 10),
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
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          ),
          if (paket.isPromo) const _PromoTag(),
        ],
      ),
    );
  }
}

// Widget baru untuk tag promo menggunakan gambar aset
class _PromoTag extends StatelessWidget {
  const _PromoTag();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -27,
      right: -26,
      child: Container(
        width: 300,
        height: 110,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Align(
          alignment: Alignment(0.8, -0.8),
          child: Text(
            'Promo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
