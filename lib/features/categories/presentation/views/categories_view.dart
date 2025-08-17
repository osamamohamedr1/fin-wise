import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_section.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_list.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.categories.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
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
