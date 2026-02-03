class Car {

  final String id;
  final String title;
  final String subtitle;
  final String price;
  final String originalPrice;
  final String imageUrl;
  bool isFavorite;
  final String brand;

  Car({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    this.isFavorite = false,
    required this.brand,
  });
}
