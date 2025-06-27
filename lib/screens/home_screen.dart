import 'package:flutter/material.dart';

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
    final double appBarHeight = AppBar().preferredSize.height;
    const double profileCardHeight = 68.0;
    final double popupTopPosition = topPadding + appBarHeight + profileCardHeight + 8;

    return Scaffold(
      appBar: const _CustomAppBar(),
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: [
              _buildProfileCard(),
              const SizedBox(height: 24),
              const _SubscriptionCard(),
              const SizedBox(height: 24),
              const _SpecialOfferSection(),
              const SizedBox(height: 24),
            ],
          ),

          if (_isAccountSwitcherOpen)
            GestureDetector(
              onTap: _toggleAccountSwitcher,
              child: Container(color: Colors.black.withAlpha(51)),
            ),
          
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _isAccountSwitcherOpen ? popupTopPosition : -300,
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

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
            color: Colors.black.withAlpha(102),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: const _AccountSwitcherDetails(),
    );
  }
}

class _AccountSwitcherDetails extends StatelessWidget {
  const _AccountSwitcherDetails();

  @override
  Widget build(BuildContext context) {
    return const Column(
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
        SizedBox(height: 8),
        Text(
          '1222502221027',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'ahmad.rizki21@gmail.com',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        SizedBox(height: 8),
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

// Part 2: Subscription and Special Offer Sections

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3B82F6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withAlpha(102),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        children: [
          _SubscriptionHeader(),
          _SubscriptionInfo(),
        ],
      ),
    );
  }
}

class _SubscriptionHeader extends StatelessWidget {
  const _SubscriptionHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aktif hingga',
            style: TextStyle(
              color: Colors.white.withAlpha(230),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '28 Juni 2025',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const _SubscriptionButtons(),
        ],
      ),
    );
  }
}

class _SubscriptionButtons extends StatelessWidget {
  const _SubscriptionButtons();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _SubscribeButton(),
        _PackageButton(),
      ],
    );
  }
}

class _SubscribeButton extends StatelessWidget {
  const _SubscribeButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}

class _PackageButton extends StatelessWidget {
  const _PackageButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Atur Paket',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _SubscriptionInfo extends StatelessWidget {
  const _SubscriptionInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: const Row(
        children: [
          _CustomCircleIcon(),
          SizedBox(width: 12),
          _InternetInfo(),
          _BroadbandInfo(),
          SizedBox(width: 8),
          _LineIndicator(),
        ],
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

class _LineIndicator extends StatelessWidget {
  const _LineIndicator();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/Line 2.png', height: 12);
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
        onPressed: () {},
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