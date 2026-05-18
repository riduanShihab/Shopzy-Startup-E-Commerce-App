import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopzyTheme {
  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF0B1326),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFDDB7FF),
        onPrimary: Color(0xFF490080),
        primaryContainer: Color(0xFFB76DFF),
        onPrimaryContainer: Color(0xFF400071),
        secondary: Color(0xFFFFB0CD),
        onSecondary: Color(0xFF640039),
        secondaryContainer: Color(0xFFAA0266),
        onSecondaryContainer: Color(0xFFFFBAD3),
        tertiary: Color(0xFF2FD9F4),
        onTertiary: Color(0xFF00363E),
        tertiaryContainer: Color(0xFF009FB4),
        onTertiaryContainer: Color(0xFF002F36),
        surface: Color(0xFF0B1326),
        onSurface: Color(0xFFDAE2FD),
        surfaceContainerHighest: Color(0xFF2D3449),
        onSurfaceVariant: Color(0xFFCFC2D6),
        outline: Color(0xFF988D9F),
        outlineVariant: Color(0xFF4D4354),
      ),
      textTheme:
          GoogleFonts.interTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme,
          ).copyWith(
            displayLarge: GoogleFonts.manrope(
              fontWeight: FontWeight.w800,
              fontSize: 48,
              height: 1.1,
              letterSpacing: -1.92,
            ),
            headlineLarge: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              height: 1.2,
              letterSpacing: -0.64,
            ),
            headlineMedium: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              height: 1.2,
            ),
            bodyLarge: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            bodyMedium: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            labelLarge: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            labelMedium: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 0.6,
            ),
            labelSmall: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
          ),
    );
  }
}
