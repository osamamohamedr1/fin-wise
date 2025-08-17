import 'package:finance_wise/core/routing/routes.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/extensions.dart';
import 'package:finance_wise/core/models/category_item_model.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_item.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightBackground,
      body: GridView.builder(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        itemCount: categoriesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: MediaQuery.sizeOf(context).width * 0.34,
        ),
        itemBuilder: (context, index) {
          final category = categoriesList[index];
          return CategoryCard(
            category: category,
            onTap: () => _onCategoryTap(context, category),
          );
        },
      ),
    );
  }
}

void _onCategoryTap(BuildContext context, CategoryItemModel category) {
  if (category.label == LocaleKeys.savings) {
    context.pushNamed(Routes.savingsView);
    return;
  }
  context.pushNamed(Routes.categoryExpensesDetails, arguments: category);
}
