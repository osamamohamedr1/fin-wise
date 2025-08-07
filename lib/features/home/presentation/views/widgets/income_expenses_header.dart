import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/title_and_amount_number.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class IncomeExpensesNumber extends StatelessWidget {
  const IncomeExpensesNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TitleAndNumber(
          isExpense: false,
          title: LocaleKeys.total_balance.tr(),
          amount: '\$5000',
        ),
        Spacer(),
        TitleAndNumber(
          isExpense: true,
          title: LocaleKeys.total_expense.tr(),
          amount: '-\$5000',
        ),
      ],
    );
  }
}
