import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();

    // Navigate to Login after delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Ambient Background Glow
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: -50,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primary.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.1),
                    blurRadius: 120,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.secondaryContainer.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: colors.secondaryContainer.withValues(alpha: 0.1),
                    blurRadius: 100,
                  ),
                ],
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.surfaceContainerHigh.withValues(alpha: 0.4),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.network(
                    'data:image/png;base64,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',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [colors.primary, colors.secondary],
                ).createShader(bounds),
                child: Text(
                  'Shopzy',
                  style: textTheme.displayLarge?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'NEXT GEN COMMERCE',
                style: textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant.withValues(alpha: 0.6),
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
          // Loading Shimmer
          Positioned(
            bottom: 64,
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              children: [
                Container(
                  height: 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [colors.primary, colors.secondaryContainer],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Secure Connection',
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
