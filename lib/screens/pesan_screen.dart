import 'package:flutter/material.dart';

// Model sederhana untuk merepresentasikan data pesan
class Message {
  final String text;
  final String time;
  final bool isUnread;

  Message({required this.text, required this.time, this.isUnread = false});
}

class PesanScreen extends StatefulWidget {
  const PesanScreen({super.key});

  @override
  State<PesanScreen> createState() => _PesanScreenState();
}

class _PesanScreenState extends State<PesanScreen> {
  // Data contoh untuk daftar pesan
  final List<Message> _messages = [
    Message(text: 'Hai, kita punya promo buat kamu sobat.', time: '9:41', isUnread: true),
    Message(text: 'Bulan ini kamu akan jatuh tempo.', time: '9:41', isUnread: true),
    Message(text: 'Pembayaran kamu berhasil terkonfirmasi.', time: 'Kemarin'),
    Message(text: 'Selamat datang di layanan kami!', time: '28/06/25'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menyesuaikan warna latar belakang sesuai Figma (#F0F3FF)
      backgroundColor: const Color(0xFFF0F3FF),
      appBar: AppBar(
        // Menyesuaikan gaya AppBar
        title: const Text(
          'Pesan',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFFF0F3FF), // Warna sama dengan body
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2937)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        // Memberi padding pada list
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          // Membuat kartu kustom untuk setiap pesan
          return _MessageCard(message: message);
        },
      ),
    );
  }
}

// Widget kustom untuk menampilkan kartu pesan
class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Teks pesan yang dapat memanjang
          Expanded(
            child: Text(
              message.text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Kolom untuk waktu dan indikator belum dibaca
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.time,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              // Tampilkan indikator jika pesan belum dibaca
              if (message.isUnread)
                const SizedBox(height: 6),
              if (message.isUnread)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
