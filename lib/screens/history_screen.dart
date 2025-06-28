import 'package:flutter/material.dart';

// Model sederhana untuk merepresentasikan data riwayat
class HistoryItem {
  final String text;
  final String time;
  final bool isNew;

  HistoryItem({required this.text, required this.time, this.isNew = false});
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Data contoh untuk daftar riwayat
  final List<HistoryItem> _historyItems = [
    HistoryItem(text: 'Penggantian paketmu berhasil', time: '9:41', isNew: true),
    HistoryItem(text: 'Pembayaran kamu berhasil terkonfirmasi.', time: '9:40'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menyesuaikan warna latar belakang sesuai Figma (#F0F3FF)
      backgroundColor: const Color(0xFFF0F3FF),
      appBar: AppBar(
        // Menyesuaikan gaya AppBar
        title: const Text(
          'History',
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
        itemCount: _historyItems.length,
        itemBuilder: (context, index) {
          final historyItem = _historyItems[index];
          // Membuat kartu kustom untuk setiap item riwayat
          return _HistoryCard(historyItem: historyItem);
        },
      ),
    );
  }
}

// Widget kustom untuk menampilkan kartu riwayat
class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.historyItem});

  final HistoryItem historyItem;

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
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Teks riwayat yang dapat memanjang
          Expanded(
            child: Text(
              historyItem.text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Kolom untuk waktu dan indikator baru
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                historyItem.time,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              // Tampilkan indikator jika item riwayat baru
              if (historyItem.isNew)
                const SizedBox(height: 6),
              if (historyItem.isNew)
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
