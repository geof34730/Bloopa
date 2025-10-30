import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme PoppinsTextTheme(Brightness b) {
  final base = GoogleFonts.poppinsTextTheme();
  final onSurface = b == Brightness.light ? const Color(0xFF1F2937) : Colors.white;
  return base.copyWith(
    displayLarge:  base.displayLarge?.copyWith(fontWeight: FontWeight.w700, color: onSurface),
    displayMedium: base.displayMedium?.copyWith(fontWeight: FontWeight.w700, color: onSurface),
    headlineLarge: base.headlineLarge?.copyWith(fontWeight: FontWeight.w700, color: onSurface),
    headlineMedium: base.headlineMedium?.copyWith(fontWeight: FontWeight.w600, color: onSurface),
    titleLarge:    base.titleLarge?.copyWith(fontWeight: FontWeight.w600, color: onSurface),
    titleMedium:   base.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: onSurface),
    titleSmall:    base.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: onSurface),
    bodyLarge:     base.bodyLarge?.copyWith(color: onSurface),
    bodyMedium:    base.bodyMedium?.copyWith(color: onSurface),
    bodySmall:     base.bodySmall?.copyWith(color: onSurface.withOpacity(.8)),
    labelLarge:    base.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: onSurface),
    labelMedium:   base.labelMedium?.copyWith(fontWeight: FontWeight.w600, color: onSurface),
    labelSmall:    base.labelSmall?.copyWith(fontWeight: FontWeight.w600, color: onSurface),
  );
}
