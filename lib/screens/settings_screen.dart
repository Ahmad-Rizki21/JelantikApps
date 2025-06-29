import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart'; // PASTIKAN PATH INI SESUAI DENGAN PROYEK ANDA

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // REVISI: Menyesuaikan warna latar belakang agar sama dengan layar History
      backgroundColor: const Color(0xFFF0F3FF), 
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Color(0xFF1E1E1E),
          ),
        ),
        // REVISI: Menyesuaikan warna AppBar agar sama dengan body
        backgroundColor: const Color(0xFFF0F3FF),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2937)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // Menggunakan ListView untuk menyusun bagian-bagian pengaturan
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Bagian "My Data"
          _buildSection(
            context,
            'My Data',
            [
              _buildSettingsTile('Profile Data', () {
                // TODO: #1 Tambahkan navigasi ke halaman edit profil
              }),
              _buildSettingsTile('Settings', () {
                // TODO: #2 Tambahkan navigasi ke halaman pengaturan notifikasi
              }),
              _buildSettingsTile('Help Center', () {
                // TODO: #3 Tambahkan navigasi ke halaman bantuan
              }),
            ],
          ),
          const SizedBox(height: 24),
          // Bagian "App Settings"
          _buildSection(
            context,
            'App Settings',
            [
              _buildSettingsTile('About', () {
                // TODO: #4 Tambahkan navigasi ke halaman tentang
              }),
              _buildSettingsTile('Feedback', () {
                // TODO: #5 Tambahkan navigasi ke halaman umpan balik
              }),
              _buildSettingsTile('Logout', () {
                // Menampilkan dialog konfirmasi saat tombol logout ditekan
                _showLogoutDialog(context);
              }, isLogout: true),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat satu bagian pengaturan yang lengkap
  Widget _buildSection(BuildContext context, String title, List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        // REVISI: Mengubah warna latar belakang bagian menjadi putih
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul bagian
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ),
          // Menggunakan ListView.separated untuk membuat daftar item dengan pemisah
          ListView.separated(
            itemCount: tiles.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => tiles[index],
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              thickness: 1,
              // Memberi warna pemisah yang lebih terang
              color: Color(0xFFF0F3FF), 
              indent: 16,
              endIndent: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat satu baris item pengaturan
  Widget _buildSettingsTile(String title, VoidCallback onTap, {bool isLogout = false}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isLogout ? Colors.red.shade700 : const Color(0xFF1E1E1E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk menampilkan dialog konfirmasi logout
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          title: const Text('Logout'),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: Text(
                'Keluar',
                style: TextStyle(color: Colors.red.shade700),
              ),
              onPressed: () {
                // 1. Tutup dialog
                Navigator.of(dialogContext).pop(); 
                
                // 2. Navigasi langsung ke LoginScreen dan hapus semua rute sebelumnya
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
