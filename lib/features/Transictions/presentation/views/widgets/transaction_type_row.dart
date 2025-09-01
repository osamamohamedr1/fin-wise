import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/transictions/presentation/manager/transactions_cubit/transaction_cubit.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/transaction_type_info.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void _onIncomeTypeTapped() {
    final transactionsCubit = context.read<TransactionsCubit>();

    setState(() {
      if (selectedType == TransactionType.income) {
        selectedType = null;
        transactionsCubit.getAllTransactions();
      } else {
        selectedType = TransactionType.income;
        transactionsCubit.getIncomeTransactions();
      }
    });
  }

  void _onExpenseTypeTapped() {
    final transactionsCubit = context.read<TransactionsCubit>();

    setState(() {
      if (selectedType == TransactionType.expense) {
        selectedType = null;
        transactionsCubit.getAllTransactions();
      } else {
        selectedType = TransactionType.expense;
        transactionsCubit.getExpenseTransactions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _onIncomeTypeTapped,
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
            onTap: _onExpenseTypeTapped,
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
