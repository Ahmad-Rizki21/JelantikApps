import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/paket_saya_screen.dart';
import 'package:flutter_application_1/screens/pilih_paket_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAccountSwitcherOpen = false;

  void _toggleAccountSwitcher() {
    setState(() {
      _isAccountSwitcherOpen = !_isAccountSwitcherOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    const double profileCardHeight = 68.0;
    final double popupTopPosition = topPadding + profileCardHeight + 8;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(16.0, topPadding + 8.0, 16.0, 8.0),
            children: const [
              SizedBox(height: 68), // Space for profile card
              SizedBox(height: 24),
              _CombinedSubscriptionSection(),
              SizedBox(height: 24),
              _ActionMenuSection(),
              SizedBox(height: 24),
              _SpecialOfferSection(),
              SizedBox(height: 24),
            ],
          ),
          // Profile card positioned at top
          Positioned(
            top: topPadding + 8.0,
            left: 16,
            right: 16,
            child: _buildProfileCard(),
          ),
          // Overlay for the account switcher
          if (_isAccountSwitcherOpen)
            GestureDetector(
              onTap: _toggleAccountSwitcher,
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
          // Animated Account Switcher Popup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _isAccountSwitcherOpen ? popupTopPosition : -350,
            left: 16,
            right: 16,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isAccountSwitcherOpen ? 1.0 : 0.0,
              child: const _AccountSwitcherContent(),
            ),
          ),
        ],
      ),
    );
  }

   Widget _buildProfileCard() {
    return InkWell(
      onTap: _toggleAccountSwitcher,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(230),
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
                    'Hi, Ahmad-Rizki21',
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
                      AnimatedRotation(
                        turns: _isAccountSwitcherOpen ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          'assets/images/Line 1.png',
                          width: 25,
                          height: 10,
                        ),
                      ),
                      const Text(
                        '1222502221027',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F2937),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 5),
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
}

class _CombinedSubscriptionSection extends StatelessWidget {
  const _CombinedSubscriptionSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        children: [
          _SubscriptionCard(),
          _InternetDetailsCard(),
        ],
      ),
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFF3B82F6),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: const IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _BillingInfoCard()),
            SizedBox(width: 12),
            Expanded(child: _PackageInfoCard()),
          ],
        ),
      ),
    );
  }
}

class _BillingInfoCard extends StatelessWidget {
  const _BillingInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tagihan Lunas',
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 186, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.check_circle,
                color: Color.fromARGB(255, 6, 186, 0),
                size: 14,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Aktif hingga',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 2),
          Text(
            '28 Desember 2025',
            style: TextStyle(
              color: Color(0xFF1E40AF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Spacer(),
          Text(
            'Tagihan berikutnya 01-01-2026',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

/// Right inner card for package speed information.
class _PackageInfoCard extends StatelessWidget {
  const _PackageInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10), // Extra spacing to push Spark down slightly
          const Center(
            child: Text(
              'Spark',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
              ),
            ),
          ),
          const Spacer(), // Pushes the speed to center
          const SizedBox(height: 1), // Extra spacing to push speed down slightly
          const Center( // Centers the speed horizontally
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '50',
                  style: TextStyle(
                    color: Color(0xFF1E40AF), // Dark Blue
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                    height: 2.2,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'Mbps',
                  style: TextStyle(
                    color: Color(0xFF1E40AF), // Dark Blue
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(), // Pushes the ONT info to bottom
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'ONT : ZTEGC6937B3',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 19, 19, 19),
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InternetDetailsCard extends StatelessWidget {
  const _InternetDetailsCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaketSayaScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        child: const Row(
          children: [
            _CustomCircleIcon(),
            SizedBox(width: 12),
            _InternetInfo(),
            _BroadbandInfo(),
            SizedBox(width: 8),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _CustomCircleIcon extends StatelessWidget {
  const _CustomCircleIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _CircleBackground(),
          _SubtractIcon(),
        ],
      ),
    );
  }
}

class _CircleBackground extends StatelessWidget {
  const _CircleBackground();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.grey[300],
      foregroundImage: const AssetImage('assets/images/Subtract.png'),
      child: const SizedBox.shrink(),
    );
  }
}

class _SubtractIcon extends StatelessWidget {
  const _SubtractIcon();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.5),
        child: Image.asset(
          'assets/images/Subtract (1).png',
          height: 18.01,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Error loading Subtract (1).png: $error');
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _InternetInfo extends StatelessWidget {
  const _InternetInfo();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
    );
  }
}

class _BroadbandInfo extends StatelessWidget {
  const _BroadbandInfo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
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
    );
  }
}

// ignore: unused_element
class _LineIndicator extends StatelessWidget {
  const _LineIndicator();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/Line 2.png', height: 12);
  }
}

class _ActionMenuSection extends StatelessWidget {
  const _ActionMenuSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Row(
          children: [
            _buildActionItem(
              context: context,
              icon: Icons.payment,
              label: 'Pembayaran',
            ),
            _buildActionItem(
              context: context,
              icon: Icons.support_agent,
              label: 'Customer\nSupport',
            ),
            _buildActionItem(
              context: context,
              icon: Icons.speed_outlined,
              label: 'SpeedTest',
            ),
            _buildActionItem(
              context: context,
              icon: Icons.router,
              label: 'Ont / Router',
            ),
            _buildActionItem(
              context: context,
              icon: FontAwesomeIcons.instagram,
              label: 'Instagram',
            ),
            _buildActionItem(
              context: context,
              icon: FontAwesomeIcons.twitter,
              label: 'Twitter',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required BuildContext context,
    required IconData icon,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label diketuk!')),
        );
      },
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: Colors.black87, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountSwitcherContent extends StatelessWidget {
  const _AccountSwitcherContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih akun',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          SizedBox(height: 16),
          Divider(color: Color(0xFFD1D5DB), thickness: 1.5),
          SizedBox(height: 16),
          _AccountInfo(),
        ],
      ),
    );
  }
}

class _AccountInfo extends StatelessWidget {
  const _AccountInfo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ahmad-Rizki21',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2563EB),
          ),
        ),
        SizedBox(height: 4),
        Text(
          '1222502221027',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        SizedBox(height: 4),
        Text(
          'ahmad.rizki21@gmail.com',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Aktif hingga 28 Jun 2025',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}

// Part 3: Special Offer Section

class _SpecialOfferSection extends StatelessWidget {
  const _SpecialOfferSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(102),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SpecialOfferHeader(),
          SizedBox(height: 8),
          _DividerLine(),
          _ViewAllPromoButton(),
          SizedBox(height: 3),
          _OffersList(),
        ],
      ),
    );
  }
}

class _SpecialOfferHeader extends StatelessWidget {
  const _SpecialOfferHeader();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Special Offer',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1F2937),
        ),
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      child: ColoredBox(
        color: Color.fromARGB(255, 97, 97, 98),
        child: SizedBox(height: 4),
      ),
    );
  }
}

class _ViewAllPromoButton extends StatelessWidget {
  const _ViewAllPromoButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PilihPaketScreen()),
          );
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          minimumSize: const Size(50, 30),
        ),
        child: const Text(
          'Lihat semua promo',
          style: TextStyle(
            color: Color(0xFF3B82F6),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _OffersList extends StatelessWidget {
  const _OffersList();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _OfferItem(
          title: 'Lighting',
          speed: '10 Mbps',
          price: 'Rp 166,500* / Bulan',
        ),
        Divider(
          thickness: 1,
          color: Color(0xFFF3F4F6),
          indent: 16,
          endIndent: 16,
        ),
        _OfferItem(
          title: 'Spark',
          speed: '50 Mbps',
          price: 'Rp 321,789* / Bulan',
        ),
      ],
    );
  }
}

class _OfferItem extends StatelessWidget {
  const _OfferItem({
    required this.title,
    required this.speed,
    required this.price,
  });

  final String title;
  final String speed;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _OfferItemContent(
            title: title,
            speed: speed,
            price: price,
          ),
          const _PromoTag(),
        ],
      ),
    );
  }
}

class _OfferItemContent extends StatelessWidget {
  const _OfferItemContent({
    required this.title,
    required this.speed,
    required this.price,
  });

  final String title;
  final String speed;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(77),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withAlpha(51),
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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Broadband UpTo | $speed',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 1, 3),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF3267E3),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const _SpeedIcon(),
        ],
      ),
    );
  }
}

class _SpeedIcon extends StatelessWidget {
  const _SpeedIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Image.asset(
        'assets/images/lightning-bolt.png',
        width: 36,
        height: 36,
        color: Colors.grey[600],
      ),
    );
  }
}

class _PromoTag extends StatelessWidget {
  const _PromoTag();

  @override
  Widget build(BuildContext context) {
    return Positioned(
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