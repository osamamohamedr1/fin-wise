import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/categories/data/models/category_item_model.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_item.dart';
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
          crossAxisSpacing: 20,
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
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${category.label.tr()} selected'),
      duration: const Duration(seconds: 1),
    ),
  );
}
