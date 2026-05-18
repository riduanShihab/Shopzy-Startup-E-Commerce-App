import 'package:flutter/material.dart';
import 'dart:ui';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background abstract elements
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primaryContainer.withValues(alpha: 0.2),
                boxShadow: [
                  BoxShadow(
                    color: colors.primaryContainer.withValues(alpha: 0.2),
                    blurRadius: 120,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.secondaryContainer.withValues(alpha: 0.2),
                boxShadow: [
                  BoxShadow(
                    color: colors.secondaryContainer.withValues(alpha: 0.2),
                    blurRadius: 120,
                  ),
                ],
              ),
            ),
          ),
          // Background Image Collage (Simulating hype)
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Transform.rotate(
                angle: -0.2,
                child: Transform.scale(
                  scale: 1.2,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 9 / 16,
                    children: [
                      _buildBgImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuD2B_qhpuZdmSFpoB9LmY2zpcidlz4gzKmgKTsY-nUfoh9wTqcedqz3hKDUSAqm-de_U3gYFbx9HOOUFEcPdkyQ32nxV0zQMsg5DBlu50hzOH3gZqp2UcIZ-sjRse8Wmje4TWVvGicUdXezIkiwVtoXJxD2VsCk4WYzl9nAiKTbL4gdQysTqYGbzLOJEJer5cCuCyWIFxQJrG2oqt6LtUpipDMlhMrDNflqPIjePGGHYmSLm-UzPn5QkkLe3IrNe4sQ6bW7ezef9kQ',
                      ),
                      Transform.translate(
                        offset: const Offset(0, 80),
                        child: _buildBgImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuB9wOiNf-C4iVYuapzwL1p-Pm6sWDecnxejIQaaGU6bZ__bgQ7BYSM1wU7XqGJ4HknbJtouwMcKMMKIyp22UFYZM4wMNfnLq_rbKw2PZPx3VAiT0J4d-3FsS4udNCxM5qSYf9XW_I6EjnHZ3B2rtN6NvgS8Gt3B2BV5b5VD3X4MeZxWs0TE_jH-JVq55GNxlj2tzQUhXlCsmetHPlyhEu21HlLLAfZeEDmbQQAwmZgNKgAI22vOS2yYBnyngnHfPhSquEh3q3QpIwQ',
                        ),
                      ),
                      _buildBgImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuB7ywQrScr51Y87VqfvUkx7QcYPaxt368nXc-pD6ths1jqMXaqrBFuHnd-xhh-miYhFIRRiwLLttwxu2KnwL_fJIzR02-51Vyi6pB1J5ctDiZ7ovu1iBHsnLxawfVT0NH342TZsjI-2CJ_zMhzfzrlBs4VqWLR873qj8grFwLAohNffYHF_u3m48YdUcjyvIOslpo1NjQqO76JZv1CEESwLQ8fXgbm9rRIWajdslAl_7qPM0O-wNx-e8y-Mnji21AAx298eGfFrk0M',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Main content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [colors.primary, colors.secondary],
                    ).createShader(bounds),
                    child: Text(
                      'Shopzy',
                      style: textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Elevate your digital lifestyle with the next generation of curated essentials.',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Form Card
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.03),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EMAIL ADDRESS',
                              style: textTheme.labelSmall?.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              style: TextStyle(color: colors.onSurface),
                              decoration: InputDecoration(
                                hintText: 'hello@shopzy.com',
                                hintStyle: TextStyle(
                                  color: colors.onSurface.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                                filled: true,
                                fillColor: colors.surfaceContainerHigh,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'PASSWORD',
                              style: textTheme.labelSmall?.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              obscureText: true,
                              style: TextStyle(color: colors.onSurface),
                              decoration: InputDecoration(
                                hintText: '••••••••',
                                hintStyle: TextStyle(
                                  color: colors.onSurface.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                                filled: true,
                                fillColor: colors.surfaceContainerHigh,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, '/');
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
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
                                child: Center(
                                  child: Text(
                                    'Join the Club',
                                    style: textTheme.bodyLarge?.copyWith(
                                      color: colors.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: colors.outlineVariant.withValues(
                                      alpha: 0.3,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    'OR CONTINUE WITH',
                                    style: textTheme.labelSmall?.copyWith(
                                      color: colors.onSurface.withValues(
                                        alpha: 0.4,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: colors.outlineVariant.withValues(
                                      alpha: 0.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colors.surfaceContainerHigh,
                                      borderRadius: BorderRadius.circular(32),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.05,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.apple,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'APPLE',
                                          style: textTheme.labelSmall?.copyWith(
                                            letterSpacing: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colors.surfaceContainerHigh,
                                      borderRadius: BorderRadius.circular(32),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.05,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.g_mobiledata,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'GOOGLE',
                                          style: textTheme.labelSmall?.copyWith(
                                            letterSpacing: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        "Create one now",
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Privacy Policy",
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.4),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        "Terms of Service",
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBgImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(url, fit: BoxFit.cover),
    );
  }
}
