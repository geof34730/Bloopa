import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kBloopaPrimary = Color(0xFF31A08D);
const kBloopaPrimaryContainer = Color(0xFFE4F6E6);
const kBloopaSecondary = Color(0xFF4CAF50);
const kBloopaTertiary = Color(0xFF2F80ED);
const kBloopaError = Color(0xFFD32F2F);
const kBloopaSuccess = Color(0xFF2E7D32);
const kBloopaWarning = Color(0xFFED6C02);
const kBloopaInfo = Color(0xFF0288D1);

class BloopaExtras extends ThemeExtension<BloopaExtras> {
  final Color success;
  final Color warning;
  final Color info;
  const BloopaExtras({
    required this.success,
    required this.warning,
    required this.info,
  });

  @override
  BloopaExtras copyWith({Color? success, Color? warning, Color? info}) =>
      BloopaExtras(
        success: success ?? this.success,
        warning: warning ?? this.warning,
        info: info ?? this.info,
      );

  @override
  ThemeExtension<BloopaExtras> lerp(ThemeExtension<BloopaExtras>? other, double t) {
    if (other is! BloopaExtras) return this;
    return BloopaExtras(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}
