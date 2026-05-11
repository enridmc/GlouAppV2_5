import 'package:flutter/material.dart';

class GlourantTheme {
  const GlourantTheme._();

  static ThemeData light() {
    const seed = Color(0xFF1D6F5F);

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF6F4EF),
      useMaterial3: true,
      fontFamily: 'Arial',
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
