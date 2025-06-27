import 'package:flutter/material.dart';

class RegisterTab extends StatelessWidget {
  final TabController tabController;

  const RegisterTab({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
      child: Column(
        children: [
          _buildTextField(hintText: 'Create a Username'),
          const SizedBox(height: 20),
          _buildTextField(hintText: 'Create a Password', obscureText: true),
          const SizedBox(height: 20),
          _buildTextField(hintText: 'Confirm Password', obscureText: true),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Akun berhasil dibuat! Silakan login.'),
                    backgroundColor: Colors.green,
                  ),
                );
                tabController.animateTo(0);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                // PERUBAHAN: Menyesuaikan tinggi tombol
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Sudut lebih besar
                ),
                elevation: 5,
                shadowColor: const Color(0xFF3B82F6).withOpacity(0.4),
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hintText, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black38),
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
