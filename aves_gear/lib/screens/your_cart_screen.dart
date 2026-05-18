import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class YourCartScreen extends StatelessWidget {
  const YourCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [colors.primary, colors.secondary],
          ).createShader(bounds),
          child: Text(
            'Shopzy',
            style: textTheme.displayLarge?.copyWith(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined, color: colors.primary),
                if (cart.itemCount > 0)
                  Positioned(
                    top: 8,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colors.secondaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cart.itemCount}',
                        style: TextStyle(
                          fontSize: 10,
                          color: colors.onSecondaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20).copyWith(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Cart', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'Review your selections and head to checkout.',
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 32),
            if (cart.items.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    'Your cart is empty',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cart.items.length,
                itemBuilder: (context, i) {
                  final productId = cart.items.keys.toList()[i];
                  final cartItem = cart.items.values.toList()[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildCartItem(
                      colors: colors,
                      textTheme: textTheme,
                      context: context,
                      productId: productId,
                      imageUrl: cartItem.product.imageUrl,
                      title: cartItem.product.title,
                      subtitle: 'Size: ${cartItem.selectedSize}',
                      price: '\$${cartItem.product.price.toStringAsFixed(2)}',
                      qty: cartItem.quantity,
                    ),
                  );
                },
              ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        'FREE',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(color: Colors.white.withValues(alpha: 0.1)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: textTheme.headlineMedium?.copyWith(
                          color: colors.onSurface,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: 32,
                          color: colors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                if (cart.items.isNotEmpty) {
                  Navigator.pushNamed(context, '/checkout');
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    colors: cart.items.isNotEmpty
                        ? [colors.primary, colors.primaryContainer]
                        : [
                            colors.surfaceContainerHigh,
                            colors.surfaceContainerHigh,
                          ],
                  ),
                  boxShadow: cart.items.isNotEmpty
                      ? [
                          BoxShadow(
                            color: colors.primary.withValues(alpha: 0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Checkout',
                      style: textTheme.headlineMedium?.copyWith(
                        fontSize: 20,
                        color: cart.items.isNotEmpty
                            ? colors.onPrimary
                            : colors.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.arrow_forward,
                      color: cart.items.isNotEmpty
                          ? colors.onPrimary
                          : colors.onSurface.withValues(alpha: 0.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'SECURE ENCRYPTED PAYMENT',
                style: textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant.withValues(alpha: 0.5),
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required ColorScheme colors,
    required TextTheme textTheme,
    required BuildContext context,
    required String productId,
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
    required int qty,
  }) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Dismissible(
      key: Key(productId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: colors.errorContainer,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(Icons.delete, color: colors.onErrorContainer),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                width: 96,
                height: 96,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headlineMedium?.copyWith(
                      fontSize: 18,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: textTheme.labelSmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: textTheme.headlineMedium?.copyWith(
                          fontSize: 20,
                          color: colors.primary,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => cart.decrementItem(productId),
                              child: Icon(
                                Icons.remove,
                                size: 16,
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text('$qty', style: textTheme.labelSmall),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () => cart.incrementItem(productId),
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: colors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
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
