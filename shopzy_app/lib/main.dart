import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';

import 'package:get/get.dart';
import 'theme/shopzy_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/login_signup_screen.dart';
import 'screens/checkout_screen.dart';
import 'main_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://abftkmsogpfldxqcbxrn.supabase.co',
    anonKey: 'sb_publishable_hBr74Y9HaJ7XX04RCP7B6w_LDPM_-xb',
  );

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
      child: GetMaterialApp(
        title: 'Shopzy',
        debugShowCheckedModeBanner: false,
        theme: ShopzyTheme.themeData,
        initialRoute: '/splash',
        getPages: [
          GetPage(name: '/splash', page: () => const SplashScreen()),
          GetPage(name: '/login', page: () => const LoginSignupScreen()),
          GetPage(name: '/', page: () => const MainLayout()),
          GetPage(name: '/checkout', page: () => const CheckoutScreen()),
        ],
      ),
    );
  }
}
