import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final cart = Provider.of<CartProvider>(context);

    // Get the first item to show in summary for demonstration, or default if empty
    final firstItem = cart.items.isNotEmpty ? cart.items.values.first : null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.primary),
          onPressed: () => Navigator.pop(context),
        ),
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
          IconButton(
            icon: Icon(
              Icons.lock_outline,
              color: colors.onSurface.withValues(alpha: 0.6),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20).copyWith(bottom: 120),
        child: Column(
          children: [
            // Progress Indicator
            SizedBox(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 2,
                      color: colors.surfaceContainerHighest,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: MediaQuery.of(context).size.width * 0.6,
                    child: Container(height: 2, color: colors.primary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProgressStep(
                        '1',
                        'Shipping',
                        true,
                        colors,
                        textTheme,
                      ),
                      _buildProgressStep(
                        '2',
                        'Payment',
                        false,
                        colors,
                        textTheme,
                      ),
                      _buildProgressStep(
                        '3',
                        'Review',
                        false,
                        colors,
                        textTheme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            // Accordion 1
            Container(
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.05),
                border: Border.all(
                  color: colors.primary.withValues(alpha: 0.4),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.local_shipping, color: colors.primary),
                    title: Text(
                      'Shipping Details',
                      style: textTheme.headlineMedium?.copyWith(fontSize: 20),
                    ),
                    subtitle: Text(
                      'Where should we send your order?',
                      style: textTheme.labelSmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                'First Name',
                                'Alex',
                                colors,
                                textTheme,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField(
                                'Last Name',
                                'Rivers',
                                colors,
                                textTheme,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          'Address',
                          '123 Neon Boulevard',
                          colors,
                          textTheme,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                'City',
                                'Night City',
                                colors,
                                textTheme,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField(
                                'Zip Code',
                                '90210',
                                colors,
                                textTheme,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            gradient: LinearGradient(
                              colors: [
                                colors.primaryContainer,
                                colors.secondaryContainer,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Continue to Payment',
                              style: textTheme.headlineMedium?.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Accordion 2
            _buildCollapsedAccordion(
              Icons.payment,
              'Payment Method',
              'Secure encrypted transactions',
              colors,
              textTheme,
            ),
            const SizedBox(height: 16),
            // Accordion 3
            _buildCollapsedAccordion(
              Icons.shopping_basket,
              'Review Order',
              '${cart.itemCount} items',
              colors,
              textTheme,
            ),
            const SizedBox(height: 32),
            // Order Summary
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: textTheme.headlineMedium?.copyWith(
                      fontSize: 20,
                      color: colors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (firstItem != null) ...[
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            firstItem.product.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      firstItem.product.title,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '\$${(firstItem.product.price * firstItem.quantity).toStringAsFixed(2)}',
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Size: ${firstItem.selectedSize} | Qty: ${firstItem.quantity}',
                                style: textTheme.labelSmall?.copyWith(
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                              if (cart.itemCount > 1) ...[
                                const SizedBox(height: 4),
                                Text(
                                  '+ ${cart.itemCount - 1} more items...',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colors.primary,
                                  ),
                                ),
                              ] else ...[
                                const SizedBox(height: 4),
                                Text(
                                  'In Stock - Ready to ship',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colors.primary,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.white.withValues(alpha: 0.1)),
                    const SizedBox(height: 16),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        'FREE',
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.tertiary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: textTheme.headlineMedium?.copyWith(fontSize: 20),
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: textTheme.headlineMedium?.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        color: colors.surfaceContainerHigh,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grand Total',
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  '\$${cart.totalAmount.toStringAsFixed(2)}',
                  style: textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                cart.clear();
                Navigator.popUntil(context, ModalRoute.withName('/'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Order Placed Successfully!')),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    colors: [
                      colors.primaryContainer,
                      colors.secondaryContainer,
                    ],
                  ),
                ),
                child: Text(
                  'Final Step',
                  style: textTheme.headlineMedium?.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(
    String step,
    String label,
    bool active,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: active ? colors.primary : colors.surfaceContainerHigh,
            shape: BoxShape.circle,
            border: active ? null : Border.all(color: colors.outlineVariant),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: colors.primary.withValues(alpha: 0.4),
                      blurRadius: 15,
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              step,
              style: TextStyle(
                color: active ? colors.onPrimary : colors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: active
                ? colors.primary
                : colors.onSurface.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(color: colors.onSurface),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: colors.onSurface.withValues(alpha: 0.3),
            ),
            filled: true,
            fillColor: colors.surfaceContainerHigh,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCollapsedAccordion(
    IconData icon,
    String title,
    String subtitle,
    ColorScheme colors,
    TextTheme textTheme,
  ) {
    return Opacity(
      opacity: 0.6,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Row(
          children: [
            Icon(icon, color: colors.onSurface),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headlineMedium?.copyWith(fontSize: 20),
                  ),
                  Text(
                    subtitle,
                    style: textTheme.labelSmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.expand_more, color: colors.onSurface),
          ],
        ),
      ),
    );
  }
}
