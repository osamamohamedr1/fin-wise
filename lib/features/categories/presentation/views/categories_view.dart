import 'package:finance_wise/core/shared/widgets/income_expenses_section.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_list.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/white_container.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        spacing: 12,
        children: [
          verticalSpacing(0),
          IncomeExpensesSection(),
          Expanded(
            child: WhiteContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CategoryGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
