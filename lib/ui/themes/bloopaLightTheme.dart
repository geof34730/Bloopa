import 'dart:ui';

import 'package:flutter/material.dart';

import 'PoppinsTextTheme.dart';
import 'bloopaExtras.dart';

ThemeData bloopaLightTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: kBloopaPrimary,
    brightness: Brightness.light,
    primary: kBloopaPrimary,
    secondary: kBloopaSecondary,
    tertiary: kBloopaTertiary,
    error: kBloopaError,
    surface: const Color(0xFFFFFFFF),
    background: const Color(0xFFFAFAFA),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: scheme,
    textTheme: PoppinsTextTheme(Brightness.light),
    scaffoldBackgroundColor: scheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      elevation: 0,
      foregroundColor: scheme.onSurface,
      centerTitle: true,
      titleTextStyle: PoppinsTextTheme(Brightness.light).titleLarge,
      iconTheme: const IconThemeData(color: kBloopaPrimary),
    ),
    iconTheme: IconThemeData(color: scheme.onSurface),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: scheme.secondaryContainer,
        foregroundColor: scheme.onSecondaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.primary,
        side: BorderSide(color: scheme.primary, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: scheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: scheme.primary, width: 2),
      ),
      prefixIconColor: scheme.outline,
      hintStyle: TextStyle(color: scheme.onSurface.withOpacity(.6)),
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      color: scheme.surface,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(scheme.secondaryContainer),
      labelStyle: TextStyle(color: scheme.onSecondaryContainer),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: scheme.surface,
      selectedItemColor: scheme.primary,
      unselectedItemColor: scheme.onSurface.withOpacity(.6),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: scheme.primary,
      unselectedLabelColor: scheme.onSurface.withOpacity(.6),
      indicatorColor: scheme.primary,
      labelStyle: const TextStyle(fontWeight: FontWeight.w700),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: scheme.inverseSurface,
      contentTextStyle: TextStyle(color: scheme.onInverseSurface),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: scheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: PoppinsTextTheme(Brightness.light).titleLarge,
      contentTextStyle: PoppinsTextTheme(Brightness.light).bodyMedium,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(scheme.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    radioTheme: RadioThemeData(fillColor: WidgetStatePropertyAll(scheme.primary)),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(scheme.primary),
      trackColor: WidgetStatePropertyAll(scheme.primary.withOpacity(.4)),
    ),
    dividerTheme: DividerThemeData(color: scheme.outlineVariant),
    extensions: const [
      BloopaExtras(success: kBloopaSuccess, warning: kBloopaWarning, info: kBloopaInfo),
    ],
  );
}

