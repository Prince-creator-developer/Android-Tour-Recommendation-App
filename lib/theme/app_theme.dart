import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primary = Color(0xFF1A1A2E);
  static const Color secondary = Color(0xFF16213E);
  static const Color accent = Color(0xFFE94560);
  static const Color accentLight = Color(0xFFFF6B6B);
  static const Color gold = Color(0xFFFFB347);
  static const Color surface = Color(0xFF0F3460);
  static const Color cardBg = Color(0xFF1E2A4A);
  static const Color textPrimary = Color(0xFFE8E8F0);
  static const Color textSecondary = Color(0xFF9AA5BE);
  static const Color success = Color(0xFF4CAF82);
  static const Color white = Colors.white;

  // Category colours
  static const Map<String, Color> categoryColors = {
    'Nature': Color(0xFF4CAF82),
    'Adventure': Color(0xFFFF6B35),
    'Food': Color(0xFFFFB347),
    'City': Color(0xFF6B9FFF),
    'History': Color(0xFFB39DDB),
    'Culture': Color(0xFFFF80AB),
    'Water': Color(0xFF4DD0E1),
    'Wildlife': Color(0xFF81C784),
  };

  static Color categoryColor(String cat) =>
      categoryColors[cat] ?? const Color(0xFF9AA5BE);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primary,
      primaryColor: accent,
      colorScheme: const ColorScheme.dark(
        primary: accent,
        secondary: accentLight,
        surface: surface,
        background: primary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: accent,
        inactiveTrackColor: surface,
        thumbColor: accent,
        overlayColor: accent.withOpacity(0.2),
        valueIndicatorColor: accent,
        valueIndicatorTextStyle:
            const TextStyle(color: white, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
          elevation: 0,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );      
  }
}
