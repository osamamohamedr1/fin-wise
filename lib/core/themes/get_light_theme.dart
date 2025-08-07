import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(color: ColorsManager.darkIcon),
    scaffoldBackgroundColor: ColorsManager.mainGreen,
    brightness: Brightness.light,
    primaryColor: ColorsManager.mainGreen,
    colorScheme: const ColorScheme.light(
      primary: ColorsManager.mainGreen,
      secondary: ColorsManager.blue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.mainGreen,
      iconTheme: IconThemeData(color: ColorsManager.darkIcon),
      titleTextStyle: TextStyle(
        color: ColorsManager.darkIcon,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      //
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      //
      titleMedium: TextStyle(
        color: ColorsManager.darkIcon,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: ColorsManager.darkIcon,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: ColorsManager.darkIcon, fontSize: 18),

      bodyMedium: TextStyle(
        color: ColorsManager.darkBackground,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      //
      bodySmall: TextStyle(
        color: ColorsManager.darkIcon,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 30),
      selectedItemColor: ColorsManager.darkIcon,
      unselectedItemColor: ColorsManager.darkIcon,
      backgroundColor: Colors.transparent,
    ),
  );
}
