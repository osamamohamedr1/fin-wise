import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/latest_transiction_title.dart';
import 'package:finance_wise/core/shared/widgets/transaction_list_item.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - replace with your actual data source
    final List<TransactionModel> transactions = _getSampleTransactions();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LatestTransictionTitle(),
        verticalSpacing(16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return TransactionListItem(transaction: transactions[index]);
          },
        ),
      ],
    );
  }

  List<TransactionModel> _getSampleTransactions() {
    return [
      TransactionModel(
        id: '1',
        title: LocaleKeys.salary.tr(),
        category: LocaleKeys.income.tr(),
        amount: 5000,
        date: DateTime.now().subtract(const Duration(days: 1)),
        isExpense: false,
        iconPath: Assets.svgsSalary,
        frequency: LocaleKeys.monthly.tr(),
      ),
      TransactionModel(
        id: '2',
        title: LocaleKeys.groceries.tr(),
        category: LocaleKeys.food.tr(),
        amount: 150,
        date: DateTime.now().subtract(const Duration(days: 2)),
        isExpense: true,
        iconPath: Assets.svgsGroceries,
        frequency: LocaleKeys.weekly.tr(),
      ),
      TransactionModel(
        id: '3',
        title: LocaleKeys.fuel.tr(),
        category: LocaleKeys.transport.tr(),
        amount: 80,
        date: DateTime.now().subtract(const Duration(days: 2)),
        isExpense: true,
        iconPath: Assets.svgsTransport,
        frequency: LocaleKeys.weekly.tr(),
      ),
      TransactionModel(
        id: '4',
        title: LocaleKeys.dinner.tr(),
        category: LocaleKeys.food.tr(),
        amount: 45,
        date: DateTime.now().subtract(const Duration(days: 3)),
        isExpense: true,
        iconPath: Assets.svgsFood,
        frequency: LocaleKeys.daily.tr(),
      ),
      TransactionModel(
        id: '5',
        title: LocaleKeys.rent.tr(),
        category: LocaleKeys.rent.tr(),
        amount: 1200,
        date: DateTime.now().subtract(const Duration(days: 5)),
        isExpense: true,
        iconPath: Assets.svgsRent,
        frequency: LocaleKeys.monthly.tr(),
      ),
    ];
  }
}
