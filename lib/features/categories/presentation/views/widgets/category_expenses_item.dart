import 'package:finance_wise/core/functions/format_transiction_date.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/shared/widgets/transiction_icon.dart';
import 'package:flutter/material.dart';

class CategoryExpensesItem extends StatelessWidget {
  final TransactionModel transaction;

  const CategoryExpensesItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: ColorsManager.lightBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 15,
        children: [
          TransictionIcon(transaction: transaction),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),

                Text(
                  formatDate(transaction.date, context),

                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsManager.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              formattedAmount,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: transaction.isExpense
                    ? Colors.red
                    : ColorsManager.darkIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get formattedAmount {
    final sign = transaction.isExpense ? '-' : '+';
    return '$sign \$${transaction.amount.toStringAsFixed(0)}';
  }
}
