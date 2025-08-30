import 'package:finance_wise/core/routing/routes.dart';
import 'package:finance_wise/features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'package:finance_wise/core/models/category_item_model.dart';
import 'package:finance_wise/features/categories/presentation/views/add_expenses_view.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/add_income_view.dart';
import 'package:finance_wise/features/categories/presentation/views/add_saving_view.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_expenses_details.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.bottomNavBar:
      return MaterialPageRoute(builder: (_) => BottomNavBarView());

    case Routes.addExpenses:
      final args = settings.arguments as String?;
      return MaterialPageRoute(
        builder: (_) => AddExpensesView(preSelectedCategory: args),
      );
    case Routes.addIncome:
      return MaterialPageRoute(builder: (_) => AddIncomeView());
    case Routes.savingsView:
      return MaterialPageRoute(builder: (_) => AddSavingsView());
    case Routes.categoryExpensesDetails:
      final args = settings.arguments as CategoryItemModel;
      return MaterialPageRoute(
        builder: (_) => CategoryExpensesDetails(category: args),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text('Unknown Route')),
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
