import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(color: ColorsManager.mainGreen),
    scaffoldBackgroundColor: ColorsManager.darkBackground,
    brightness: Brightness.dark,
    primaryColor: ColorsManager.mainGreen,
    colorScheme: const ColorScheme.dark(
      primary: ColorsManager.mainGreen,
      secondary: ColorsManager.lightGreen,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.darkBackground,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: ColorsManager.lightGreen),
    ),
    textTheme: const TextTheme(
      //
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
      //
      bodySmall: TextStyle(
        color: Colors.white70,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 5,
      selectedItemColor: ColorsManager.mainGreen,
      unselectedItemColor: Colors.white70,
      backgroundColor: ColorsManager.darkCard,
      selectedIconTheme: IconThemeData(color: ColorsManager.mainGreen),
      unselectedIconTheme: IconThemeData(color: Colors.white70),
    ),
  );
}
