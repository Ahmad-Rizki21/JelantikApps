import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildSettingsItem(
            icon: Icons.person_outline,
            title: 'Edit Profil',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.notifications_outlined,
            title: 'Notifikasi',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.lock_outline,
            title: 'Privasi & Keamanan',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.help_outline,
            title: 'Bantuan',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsItem(
            icon: Icons.logout,
            title: 'Logout',
            color: Colors.red,
            onTap: () {
              // TODO: Tambahkan logika logout
            },
          ),
        ],
      ),
    );
  }

  // Helper widget untuk membuat item pengaturan
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}