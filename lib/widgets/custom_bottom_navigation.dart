import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Fungsi helper untuk membuat item navigasi dengan gaya yang lebih tegas
    BottomNavigationBarItem buildNavItem(String iconPath, String label, int index) {
      final bool isSelected = currentIndex == index;
      // Gunakan abu-abu yang sedikit lebih gelap agar lebih kontras
      final Color color = isSelected ? const Color(0xFF3B82F6) : Colors.grey.shade600;
      // Ukuran ikon yang lebih besar untuk membuatnya lebih menonjol
      final double iconSize = isSelected ? 28.0 : 26.0; 
      // Berat font yang lebih tebal saat item dipilih

      return BottomNavigationBarItem(
        icon: Padding(
          // Beri sedikit ruang vertikal untuk ikon yang lebih besar
          padding: const EdgeInsets.only(top: 2.0, bottom: 4.0), 
          child: ImageIcon(
            AssetImage(iconPath),
            color: color,
            size: iconSize, // Terapkan ukuran ikon baru
          ),
        ),
        label: label,
      );
    }

    return Container(
      // Dekorasi dengan bayangan untuk memberikan efek 'elevated'
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.20),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      // BottomNavigationBar dibungkus dengan SafeArea agar tidak terhalang oleh UI sistem
      child: SafeArea(
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            buildNavItem('assets/images/Home.png', 'Home', 0),
            buildNavItem('assets/images/History.png', 'History', 1),
            buildNavItem('assets/images/Pesan.png', 'Pesan', 2),
            buildNavItem('assets/images/Settings.png', 'Settings', 3),
          ],
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          // Terapkan gaya teks yang lebih tebal untuk label yang dipilih
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          selectedItemColor: const Color(0xFF3B82F6),
          unselectedItemColor: Colors.grey.shade600,
          elevation: 0, // Elevation di-handle oleh Container
        ),
      ),
    );
  }
}
