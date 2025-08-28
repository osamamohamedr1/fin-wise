import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/shared/widgets/no_transactions_widget.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/core/shared/widgets/transaction_list_item.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionsList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpacing(16),
          Center(child: NoTransactionsWidget()),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
}

List<TransactionModel> getSampleTransactions() {
  return [
    TransactionModel(
      title: LocaleKeys.salary.tr(),
      category: LocaleKeys.income.tr(),
      amount: 5000,
      date: DateTime.now().subtract(const Duration(days: 1)),
      isExpense: false,
      iconPath: Assets.svgsSalary,
      frequency: LocaleKeys.monthly.tr(),
    ),
    TransactionModel(
      title: LocaleKeys.groceries.tr(),
      category: LocaleKeys.food.tr(),
      amount: 150,
      date: DateTime.now().subtract(const Duration(days: 2)),
      isExpense: true,
      iconPath: Assets.svgsGroceries,
      frequency: LocaleKeys.weekly.tr(),
    ),
    TransactionModel(
      title: LocaleKeys.fuel.tr(),
      category: LocaleKeys.transport.tr(),
      amount: 80,
      date: DateTime.now().subtract(const Duration(days: 2)),
      isExpense: true,
      iconPath: Assets.svgsTransport,
      frequency: LocaleKeys.weekly.tr(),
    ),
    TransactionModel(
      title: LocaleKeys.dinner.tr(),
      category: LocaleKeys.food.tr(),
      amount: 45,
      date: DateTime.now().subtract(const Duration(days: 3)),
      isExpense: true,
      iconPath: Assets.svgsFood,
      frequency: LocaleKeys.daily.tr(),
    ),
    TransactionModel(
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
