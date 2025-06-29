class Paket {
  final String title;
  final String speed;
  final String price;
  final String activePeriod;
  final String description;
  final bool isPromo;

  const Paket({
    required this.title,
    required this.speed,
    required this.price,
    this.activePeriod = '1 Bulan',
    this.description = '',
    this.isPromo = false,
  });
}
