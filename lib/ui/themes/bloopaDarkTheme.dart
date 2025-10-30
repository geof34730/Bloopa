import 'package:flutter/material.dart';

import 'PoppinsTextTheme.dart';
import 'bloopaExtras.dart';


ThemeData bloopaDarkTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: kBloopaPrimary,
    brightness: Brightness.dark,
    primary: kBloopaPrimary,
    secondary: kBloopaSecondary,
    tertiary: kBloopaTertiary,
    error: kBloopaError,
    surface: const Color(0xFF0E1116),
    background: const Color(0xFF0B0E13),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: scheme,
    textTheme: PoppinsTextTheme(Brightness.dark),
    scaffoldBackgroundColor: scheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      elevation: 0,
      foregroundColor: scheme.onSurface,
      centerTitle: true,
      titleTextStyle: PoppinsTextTheme(Brightness.dark).titleLarge,
      iconTheme: const IconThemeData(color: kBloopaPrimary),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: scheme.surface,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: scheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: scheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: scheme.primary, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: scheme.surface,
      selectedItemColor: scheme.primary,
      unselectedItemColor: scheme.onSurface.withOpacity(.7),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: scheme.inverseSurface,
      contentTextStyle: TextStyle(color: scheme.onInverseSurface),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    extensions: const [
      BloopaExtras(success: kBloopaSuccess, warning: kBloopaWarning, info: kBloopaInfo),
    ],
  );
}
