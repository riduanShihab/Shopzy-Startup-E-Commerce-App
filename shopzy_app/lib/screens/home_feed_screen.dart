import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'your_cart_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import 'product_details_screen.dart';

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final products = Provider.of<ProductProvider>(context).products;

    return Stack(
      children: [
        PageView(
          scrollDirection: Axis.vertical,
          children: products.map((product) {
            return _buildVideoFeedItem(
              context: context,
              colors: colors,
              textTheme: textTheme,
              product: product,
            );
          }).toList(),
        ),
        // Top App Bar overlaid
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: colors.primary),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [colors.primary, colors.secondary],
                    ).createShader(bounds),
                    child: Text(
                      'Shopzy',
                      style: textTheme.displayLarge?.copyWith(
                        fontSize: 28, // Smaller for app bar
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _buildCartIcon(context, colors),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartIcon(BuildContext context, ColorScheme colors) {
    final cart = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => const YourCartScreen());
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
        Icon(Icons.shopping_bag_outlined, color: colors.primary),
        if (cart.itemCount > 0)
          Positioned(
            top: -4,
            right: -4,
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
    );
  }

  Widget _buildVideoFeedItem({
    required BuildContext context,
    required ColorScheme colors,
    required TextTheme textTheme,
    required Product product,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image
        Image.network(product.imageUrl, fit: BoxFit.cover),
        // Gradient overlay for text readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [colors.surface, Colors.transparent, Colors.transparent],
              stops: const [0.0, 0.4, 1.0],
            ),
          ),
        ),
        // Right side interaction hub
        Positioned(
          right: 16,
          bottom: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInteractionButton(Icons.favorite, product.likes, colors),
              const SizedBox(height: 24),
              _buildInteractionButton(
                Icons.chat_bubble_outline,
                product.comments,
                colors,
              ),
              const SizedBox(height: 24),
              _buildInteractionButton(Icons.share, 'Share', colors),
              const SizedBox(height: 32),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.primary, width: 2),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDnA35580EcsW1LwD90FIzpM0_849W2uSBueBPxHUflqgyRvJc0i852-YoRiTBlNN1u1CfLALBKSwMii-nTqqCq_Ph_0h75bO0M3u2guGu6A4ctpavyi2s9Fdx7o9b5pMyw3NrFRGvWmv9qpDz6zmTIFqLTlnSqIj6ZqTveGr7EIYTCHsE155wu-iN8_J53QfJBjMFwz8602gxErDHu-1UMehUBtDTWTFS-n7uFAMV5kuyJZAyTsif6lvbNIjYpQtbfPHPHJDXGYHw',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Bottom Content Overlay
        Positioned(
          left: 20,
          right: 80,
          bottom: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: product.tags.map((tag) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _buildTag(
                      tag,
                      colors.primary.withValues(alpha: 0.2),
                      colors.primary.withValues(alpha: 0.3),
                      colors.primary,
                      textTheme,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Text(
                product.title,
                style: textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addItem(product, product.sizes.first);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added ${product.title} to Cart'),
                            duration: const Duration(seconds: 1),
                            backgroundColor: colors.primaryContainer,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            colors: [
                              colors.primaryContainer,
                              colors.secondaryContainer,
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Quick Add',
                              style: textTheme.labelMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailsPage(productId: product.id));
                },
                child: Text(
                  'View Details',
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: colors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTag(
    String text,
    Color bg,
    Color border,
    Color textColor,
    TextTheme textTheme,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(color: border),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: textTheme.labelSmall?.copyWith(
              color: textColor,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInteractionButton(
    IconData icon,
    String label,
    ColorScheme colors,
  ) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
