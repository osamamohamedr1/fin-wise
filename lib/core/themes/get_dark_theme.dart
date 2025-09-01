import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(color: ColorsManager.mainGreen),
    scaffoldBackgroundColor: ColorsManager.darkthemeBackground,
    brightness: Brightness.dark,
    primaryColor: ColorsManager.mainGreen,
    colorScheme: const ColorScheme.dark(
      primary: ColorsManager.mainGreen,
      secondary: ColorsManager.lightGreen,
      surface: ColorsManager.darkContainer,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.darkBackground,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: ColorsManager.mainGreen),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.mainGreen,
      foregroundColor: Colors.white,
    ),
    cardTheme: const CardThemeData(color: ColorsManager.darkContainer),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainGreen,
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      //
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      //
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18.sp),

      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      //
      bodySmall: TextStyle(
        color: Colors.white70,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 30),
      selectedItemColor: ColorsManager.mainGreen,
      unselectedItemColor: Colors.white70,
      backgroundColor: Colors.transparent,
    ),
  );
}
