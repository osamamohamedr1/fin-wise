import 'package:finance_wise/core/routing/routes.dart';
import 'package:finance_wise/features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'package:finance_wise/features/profile/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.bottomNavBar:
      return MaterialPageRoute(builder: (_) => BottomNavBarView());
    case Routes.settings:
      return MaterialPageRoute(builder: (_) => SettingsView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text('Unknown Route')),
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
