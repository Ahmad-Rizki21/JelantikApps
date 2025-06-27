import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'pesan_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    PesanScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // PERUBAHAN: Menambahkan Container untuk garis atas
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          // PERUBAHAN: Menggunakan ikon kustom dari aset
          items: <BottomNavigationBarItem>[
            _buildNavItem('assets/images/Home.png', 'Home', 0),
            _buildNavItem('assets/images/History.png', 'History', 1),
            _buildNavItem('assets/images/Pesan.png', 'Pesan', 2),
            _buildNavItem('assets/images/Settings.png', 'Settings', 3),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0, // Hapus shadow bawaan karena sudah di-handle Container
        ),
      ),
    );
  }

  // Widget helper untuk membuat item navigasi
  BottomNavigationBarItem _buildNavItem(String iconPath, String label, int index) {
    final bool isSelected = _selectedIndex == index;
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
}
