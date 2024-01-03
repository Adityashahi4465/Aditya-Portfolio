import 'package:flutter/material.dart';

import '../core/utils/color.dart';

class AppColors {
  static Color primary = Color(
    getColorHexFromStr(
      "#050546",
    ),
  );
  static Color primaryDark = Color(
    getColorHexFromStr(
      "#0A115C",
    ),
  );

  static Color primaryLightDark = Color(
    getColorHexFromStr(
      "#08084E",
    ),
  );
  static Color darkPurple = Color(
    getColorHexFromStr(
      "#181764",
    ),
  );
  static const Color primaryLight = Color(0xFF5472D3);
  static const Color accent = Color(0xFF00B0FF);
  static const Color accentDark = Color(0xFF007BBB);
  static const Color accentLight = Color(0xFF62EFFF);
  static const Color background = Color(0xFFE3F2FD);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyDark = Color(0xFF424242);
  static const Color greyLight = Color.fromARGB(255, 228, 228, 228);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
}
