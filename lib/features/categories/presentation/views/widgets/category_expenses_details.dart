import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/routing/routes.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_section.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/extensions.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/data/models/category_item_model.dart';
import 'package:finance_wise/features/categories/data/repos/transaction_repository.dart';
import 'package:finance_wise/features/categories/presentation/manger/cubit/category_expenses_cubit.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_expenses_list.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryExpensesDetails extends StatelessWidget {
  final CategoryItemModel category;

  const CategoryExpensesDetails({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryExpensesCubit(TransactionRepositoryImpl())
            ..loadTransactions(category: category.label),
      child: Scaffold(
        appBar: AppBar(title: Text(category.label.tr()), centerTitle: true),
        body: Column(
          spacing: 12,
          children: [
            verticalSpacing(0),
            const IncomeExpensesSection(),
            Expanded(
              child: WhiteContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      const Expanded(child: CategoryExpensesList()),

                      ElevatedButton(
                        onPressed: () {
                          context.pushNamed(Routes.addExpenses);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.mainGreen,
                        ),
                        child: Text(
                          LocaleKeys.add_expenses.tr(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),

                      verticalSpacing(8),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
