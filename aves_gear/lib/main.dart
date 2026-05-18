import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';

import 'theme/shopzy_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/login_signup_screen.dart';
import 'screens/checkout_screen.dart';
import 'main_layout.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const ShopzyApp());
}

class ShopzyApp extends StatelessWidget {
  const ShopzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Shopzy',
        debugShowCheckedModeBanner: false,
        theme: ShopzyTheme.themeData,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginSignupScreen(),
          '/': (context) => const MainLayout(),
          '/checkout': (context) => const CheckoutScreen(),
        },
      ),
    );
  }
}
