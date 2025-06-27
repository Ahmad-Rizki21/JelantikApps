import 'package:flutter/material.dart';

class PesanScreen extends StatelessWidget {
  const PesanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView.separated(
        itemCount: 5, // Jumlah pesan contoh
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://placehold.co/100x100/E2E8F0/475569?text=CS'),
            ),
            title: Text('Customer Service ${index + 1}'),
            subtitle: const Text('Ini adalah contoh isi pesan...'),
            // ignore: unnecessary_brace_in_string_interps
            trailing: Text('12:3${index} PM'),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}