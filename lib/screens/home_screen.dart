import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF3F4F6),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined, color: Colors.black54),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF3F4F6),
      body: ListView(
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
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/Ellipse 245.png'),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi, Aryan Sulaiman',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Text(
                    '1222502221027',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ],
          )
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
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aktif hingga', style: TextStyle(color: Colors.white.withOpacity(0.9))),
                const SizedBox(height: 4),
                const Text('28 Desember 2021', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF3B82F6),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text('Langganan', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Atur Paket', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                      // PERUBAHAN WARNA FONT
                      Text('Internet', style: TextStyle(color: Color(0xFF11317D), fontSize: 14)),
                      Text('Sampai dengan', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF11317D), fontSize: 16)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    // PERUBAHAN WARNA FONT
                    Text('Broadband UpTo', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF11317D), fontSize: 14)),
                    Text('10 Mbps', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF11317D), fontSize: 16)),
                  ],
                ),
                const SizedBox(width: 8),
                Image.asset('assets/images/Line 2.png', height: 12),
              ],
            ),
          )
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
          Image.asset(
            'assets/images/Subtract.png',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 4),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0.5), 
              child: Image.asset(
                'assets/images/Subtract (1).png',
                height: 18.01,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSpecialOfferSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Special Offer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Lihat semua promo',
                  style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          const Divider(),
          _buildOfferItem('Lighting', '10 Mbps', 'Rp 166,500* / Bulan'),
          const Divider(indent: 16, endIndent: 16),
          _buildOfferItem('Spark', '50 Mbps', 'Rp 321,789* / Bulan'),
        ],
      ),
    );
  }

  Widget _buildOfferItem(String title, String speed, String price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Broadband UpTo | $speed', style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(price, style: const TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const Icon(Icons.flash_on, color: Colors.orange, size: 28),
              )
            ],
          ),
          Positioned(
            top: -24,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(8)
              ),
              child: const Text('Promo', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
