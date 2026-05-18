import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'your_cart_screen.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final product = Provider.of<ProductProvider>(
      context,
      listen: false,
    ).findById(widget.productId);

    _selectedSize ??= product.sizes.first;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.primary),
          onPressed: () => Get.back(),
        ),
        actions: [_buildCartIcon(context, colors)],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Gallery
                SizedBox(
                  height: MediaQuery.of(context).size.width * 1.33,
                  child: Image.network(product.imageUrl, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              style: textTheme.headlineMedium,
                            ),
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: textTheme.headlineMedium?.copyWith(
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                index < 4 ? Icons.star : Icons.star_half,
                                color: colors.primary,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '4.8 (${product.comments} REVIEWS)',
                            style: textTheme.labelMedium?.copyWith(
                              color: colors.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'SELECT SIZE',
                        style: textTheme.labelMedium?.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: product.sizes.map((size) {
                          bool isSelected = size == _selectedSize;
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSize = size;
                                });
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? colors.primary
                                        : Colors.white.withValues(alpha: 0.1),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    size,
                                    style: textTheme.labelMedium?.copyWith(
                                      color: isSelected
                                          ? colors.primary
                                          : colors.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Community Style',
                            style: textTheme.headlineMedium,
                          ),
                          Text(
                            'VIEW ALL',
                            style: textTheme.labelMedium?.copyWith(
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Just a placeholder row for Community Style
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildCommunityImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuDQtqMeMzg1gLMzzI5V7gorPvHShVfQnfcPVZdMk7JDE8nzsU_MW6Id6rcOoik6ND2H4H8GITjsW8kHqydp3Bv8qQakF9kA11BT5RNb1JUixG0v6pw7KZcVp-6Buv_zsS2Azq9-uFT54ijpj7jjhZSkEVJTKOlL03REpKrXgdbaxZ8f9Wep_pICLKUPvxwrp9TUazViv8hAvv1CVnICVAf2heL0uIJsbtPvjJbNr_6dowbm7UMbmeSg0YD8LgBfqVY0I2UhSmH-2A4',
                              '@alexa_v',
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuCYV5VzBSSyWUx4hxPMHj-l-AqX1J7yf0cQuDH21cw_YGHNKYZWDw6GuFDFjWnrIP1oqrMRFfUymZNC4zPPIOX3lS_wn0_zMlQnF6ioLPCKBwmd-i9TCA3UBE2Oq5J0V_tee0soEupdy18SXL0Y8Raqe-5t89S64LTvl1TMyw-Td1UzJ18NEAmTc_BEJs4Hy8Q7BecP2WMv13jfIeyD86_AuztBXADSql0C-ya_qHAMXKEarJFjt6VYjwbsgeg14Biw9zucaRC00Nc',
                            ),
                            const SizedBox(width: 16),
                            _buildCommunityImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuDs4KIvZSYOauvOUXQABMLaNN0QgZptKT1-6Pt8EHbNZrb0jTzna-nb6aAe7hOPyOc5YuebBNIyuwuXisVxZowogPibbX67baNZlcW137ksGZafzl_fRvLE3S9an_c3HspXaT5AfrLTrjWuLuGRFVfpMKGO6shDvJBT-uZ-0K4QvSyYei3Q-mz9TzrUt7Hl7O1T3NVKDHM05HZopXUyldPapyP9mW8DyHNo2Xa1T93IYcLc6xeUIImuQxWDWWxGHslKAIHz8iBVOBk',
                              '@marcus_m',
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuC3eWKueJCMsV1QEBNTCq0gPnVJWYZR-hgimCYNe8B2t_IZOu88z6F4xcXedJnUb5pc3H9FHD-eH9KV3v5YqnOj_UD1O6MBbEo9gXX4GEgusS-GFEIX1NETJ7-qmFSne6YOTvBXQQRD8GU1TDU80qBHAQ2X4869Fcph5W-odcGBWqpkJpLpQJU5wGA-iNZZmagATxW6E3WHeycTzrQsdIu0gaWJej4wR_fgiR2OAwLWcRLMdADSuxxBJ4RQUIwt73gxP4gxhTgq1F8',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildReviewCard(
                        colors: colors,
                        textTheme: textTheme,
                        initial: 'J',
                        name: 'Jordan S.',
                        review: '"${product.description}"',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating Add to Cart Button
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addItem(product, _selectedSize!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added ${product.title} to Cart'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: colors.primaryContainer,
                  ),
                );
              },
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    colors: [
                      colors.primaryContainer,
                      colors.secondaryContainer,
                      colors.secondary,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors.secondary.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart, color: Colors.white),
                    const SizedBox(width: 12),
                    Text(
                      'ADD TO CART',
                      style: textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartIcon(BuildContext context, ColorScheme colors) {
    final cart = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          Get.to(() => const YourCartScreen());
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
          Icon(Icons.shopping_bag_outlined, color: colors.primary),
          if (cart.itemCount > 0)
            Positioned(
              top: 10,
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
    );
  }

  Widget _buildCommunityImage(
    String imageUrl,
    String username,
    String avatarUrl,
  ) {
    return Container(
      width: 140,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 12,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(avatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard({
    required ColorScheme colors,
    required TextTheme textTheme,
    required String initial,
    required String name,
    required String review,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.surfaceContainerHigh,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        initial,
                        style: TextStyle(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: textTheme.labelMedium?.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                      Text(
                        'VERIFIED BUYER',
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.4),
                          fontSize: 10,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(Icons.star, color: colors.primary, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            review,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onSurface.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
