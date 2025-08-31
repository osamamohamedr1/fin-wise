import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/shared/widgets/no_transactions_widget.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/core/shared/widgets/transaction_list_item.dart';
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
