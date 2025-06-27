import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'onboarding_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Jelantik_Logo.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 16),
                  // const Text(
                  //   'Jelantik',
                  //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(height: 8),
                  const Text(
                    'Additional information provided here.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xFF3B82F6),
                unselectedLabelColor: Colors.black54,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0, color: Color(0xFF3B82F6)),
                  insets: EdgeInsets.symmetric(horizontal: 60.0),
                ),
                tabs: const [
                  Tab(
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600))),
                  Tab(
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600))),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.black12, indent: 40, endIndent: 40),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const LoginTab(),
                  RegisterTab(tabController: _tabController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
      child: Column(
        children: [
          _buildTextField(hintText: 'Username'),
          const SizedBox(height: 20),
          _buildTextField(hintText: 'Password', obscureText: true),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
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
                'Login',
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
