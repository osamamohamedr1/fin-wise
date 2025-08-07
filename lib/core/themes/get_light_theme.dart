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
      titleLarge: TextStyle(
        color: ColorsManager.darkIcon,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.darkIcon,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: ColorsManager.darkIcon,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: ColorsManager.darkIcon, fontSize: 18),
      bodyMedium: TextStyle(color: ColorsManager.darkIcon, fontSize: 16),
      bodySmall: TextStyle(color: Colors.grey, fontSize: 14),
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
