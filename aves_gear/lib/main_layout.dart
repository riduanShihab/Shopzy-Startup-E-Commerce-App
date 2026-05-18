import 'package:flutter/material.dart';
import 'dart:ui';
import 'screens/home_feed_screen.dart';
import 'screens/your_cart_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeFeedPage(),
          Center(child: Text("Search")),
          Center(child: Text("Favorites")),
          YourCartScreen(),
          Center(child: Text("Profile")),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: colors.surface.withValues(alpha: 0.1),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(Icons.home, 0, _selectedIndex == 0, colors),
                  _buildNavItem(Icons.search, 1, _selectedIndex == 1, colors),
                  _buildNavItem(
                    Icons.favorite_border,
                    2,
                    _selectedIndex == 2,
                    colors,
                  ),
                  _buildNavItem(
                    Icons.shopping_cart_outlined,
                    3,
                    _selectedIndex == 3,
                    colors,
                  ),
                  _buildNavItem(
                    Icons.person_outline,
                    4,
                    _selectedIndex == 4,
                    colors,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    bool isSelected,
    ColorScheme colors,
  ) {
    if (isSelected) {
      return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colors.primary, colors.primaryContainer],
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: colors.onPrimary),
      );
    }
    return IconButton(
      icon: Icon(icon, color: colors.onSurface.withValues(alpha: 0.6)),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
