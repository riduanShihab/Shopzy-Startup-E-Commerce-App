class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> tags;
  final String likes;
  final String comments;
  final List<String> sizes;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.tags = const [],
    this.likes = '0',
    this.comments = '0',
    this.sizes = const ['S', 'M', 'L', 'XL'],
  });
}
