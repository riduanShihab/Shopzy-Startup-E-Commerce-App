import 'product.dart';

class CartItem {
  final String id;
  final Product product;
  final String selectedSize;
  final int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.selectedSize,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      product: product,
      selectedSize: selectedSize,
      quantity: quantity ?? this.quantity,
    );
  }
}
