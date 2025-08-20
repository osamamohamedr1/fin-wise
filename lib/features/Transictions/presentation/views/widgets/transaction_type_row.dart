import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/transaction_type_info.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/widgets.dart';

enum TransactionType { income, expense }

class TransactionTypeRow extends StatefulWidget {
  const TransactionTypeRow({
    super.key,
    required this.income,
    required this.expense,
  });
  final double income;
  final double expense;

  @override
  State<TransactionTypeRow> createState() => _TransactionTypeRowState();
}

class _TransactionTypeRowState extends State<TransactionTypeRow> {
  TransactionType? selectedType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedType = (selectedType == TransactionType.income)
                    ? null
                    : TransactionType.income;
              });
            },
            child: TransactionTypeInfo(
              isExpense: false,
              title: LocaleKeys.income.tr(),
              amount: '\$${widget.income.toStringAsFixed(2)}',
              isSelected: selectedType == TransactionType.income,
            ),
          ),
        ),
        horizontalSpacing(16),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedType = (selectedType == TransactionType.expense)
                    ? null
                    : TransactionType.expense;
              });
            },
            child: TransactionTypeInfo(
              isExpense: true,
              title: LocaleKeys.expense.tr(),
              amount: '-\$${widget.expense.toStringAsFixed(2)}',
              isSelected: selectedType == TransactionType.expense,
            ),
          ),
        ),
      ],
    );
  }
}
