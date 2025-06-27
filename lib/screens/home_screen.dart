import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAccountSwitcherOpen = false;

  // PERUBAHAN: Fungsi ini sekarang hanya mengubah state untuk menampilkan/menyembunyikan popup
  void _toggleAccountSwitcher() {
    setState(() {
      _isAccountSwitcherOpen = !_isAccountSwitcherOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi AppBar dan status bar untuk penempatan popup yang akurat
    final double topPadding = MediaQuery.of(context).padding.top;
    final double appBarHeight = AppBar().preferredSize.height;
    // Perkiraan posisi vertikal popup: di bawah AppBar + padding + tinggi kartu profil
    const double profileCardHeight = 68.0; 
    final double popupTopPosition = topPadding + appBarHeight + profileCardHeight + 8;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFF3F4F6),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined, color: Color(0xFF6B7280)),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF3F4F6),
      // PERUBAHAN UTAMA: Menggunakan Stack untuk menumpuk popup
      body: Stack(
        children: [
          // Konten utama
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: [
              _buildProfileCard(),
              const SizedBox(height: 24),
              _buildSubscriptionCard(),
              const SizedBox(height: 24),
              _buildSpecialOfferSection(),
              const SizedBox(height: 24),
            ],
          ),

          // Lapisan Overlay Popup
          if (_isAccountSwitcherOpen)
            // Latar belakang transparan untuk menutup popup saat diklik
            GestureDetector(
              onTap: _toggleAccountSwitcher,
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          
          // Popup yang dianimasikan
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _isAccountSwitcherOpen ? popupTopPosition : -300, // Muncul dari atas
            left: 16,
            right: 16,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isAccountSwitcherOpen ? 1.0 : 0.0,
              child: _buildAccountSwitcherContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return InkWell(
      onTap: _toggleAccountSwitcher, // Memanggil fungsi untuk toggle popup
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 68, // Memberi tinggi pasti agar posisi popup akurat
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/Ellipse 245.png'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hi, Aryan Sulaiman',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '1222502221027',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F2937),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      AnimatedRotation(
                        turns: _isAccountSwitcherOpen ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(Icons.arrow_drop_down, color: Color(0xFF6B7280)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk konten popup
  Widget _buildAccountSwitcherContent() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Pilih akun',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 16),
          Divider(color: Color(0xFFE5E7EB), thickness: 1),
          SizedBox(height: 16),
          Text(
            'Aryan Sulaiman',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3B82F6),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '1222502221027',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'aryan@gmail.com',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Aktif hingga 28 Des 2025',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3B82F6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aktif hingga',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                const Text(
                  '28 Desember 2021',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF3B82F6),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text(
                        'Langganan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Atur Paket',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                _buildCustomCircleIcon(),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Internet',
                        style: TextStyle(color: Color(0xFF11317D), fontSize: 14),
                      ),
                      Text(
                        'Sampai dengan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF11317D),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Broadband UpTo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF11317D),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '10 Mbps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF11317D),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Image.asset('assets/images/Line 2.png', height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCircleIcon() {
  return SizedBox(
    width: 32,
    height: 32,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Menggunakan CircleAvatar untuk lingkaran dasar
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey[300], // Warna abu-abu untuk latar
          foregroundImage: const AssetImage('assets/images/Subtract.png'),
          child: const SizedBox.shrink(), // Placeholder jika gambar gagal
        ),
        // Ikon kecil di bawah dengan filterQuality untuk smoothing
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0.5),
            child: Image.asset(
              'assets/images/Subtract (1).png',
              height: 18.01,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high, // Meningkatkan kualitas rendering
              errorBuilder: (context, error, stackTrace) {
                print('Error loading Subtract (1).png: $error'); // Debugging
                return const SizedBox.shrink(); // Fallback jika gagal
              },
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildSpecialOfferSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Special Offer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
            ),
          ),
          const SizedBox(height: 8),
          // const Divider(thickness: 6, color: Color.fromARGB(255, 97, 97, 98)),
          SizedBox(
              width: 300, // atau double.infinity jika ingin penuh sesuai parent
              child: Container(
                height: 4,
                color: const Color.fromARGB(255, 97, 97, 98),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                minimumSize: const Size(50, 30),
              ),
              child: const Text(
                'Lihat semua promo',
                style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 3),
          _buildOfferItem('Lighting', '10 Mbps', 'Rp 166,500* / Bulan'),
          const Divider(thickness: 1, color: Color(0xFFF3F4F6), indent: 16, endIndent: 16),
          _buildOfferItem('Spark', '50 Mbps', 'Rp 321,789* / Bulan'),
        ],
      ),
    );
  }

  Widget _buildOfferItem(String title, String speed, String price) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Container utama
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 245, 245),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                      const SizedBox(height: 4),
                      Text('Broadband UpTo | $speed', style: const TextStyle(color: Color.fromARGB(255, 0, 1, 3), fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(price, style: const TextStyle(color: Color(0xFF3267E3), fontWeight: FontWeight.bold, fontSize: 16)), // Warna dan bold disesuaikan
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    'assets/images/lightning-bolt.png',
                    width: 36,
                    height: 36,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        // Tag Promo
        Positioned(
          top: -15,
          right: -11,
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
                alignment: Alignment(0.8, -0.8), // atur sesuai kebutuhan
                child: Text(
                  'Promo',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
