import 'package:app/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      );
}
