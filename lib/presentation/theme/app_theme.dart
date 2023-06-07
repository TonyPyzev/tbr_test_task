import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppTheme {
  ThemeData get theme {
    return ThemeData().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 24,
          height: 1.3,
          color: AppColors.title,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.title,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.caption,
        ),
      ),
    );
  }
}
