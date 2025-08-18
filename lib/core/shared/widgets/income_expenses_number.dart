import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/title_and_amount_number.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IncomeExpensesNumber extends StatelessWidget {
  const IncomeExpensesNumber({
    super.key,
    required this.totalBalance,
    required this.totalExpense,
  });
  final double totalBalance;
  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        horizontalSpacing(10),
        TitleAndNumber(
          isExpense: false,
          title: LocaleKeys.total_balance.tr(),
          amount: '\$${totalBalance.toStringAsFixed(2)}',
        ),

        Expanded(child: SvgPicture.asset(Assets.svgsVline)),

        TitleAndNumber(
          isExpense: true,
          title: LocaleKeys.total_expense.tr(),
          amount: '-\$${totalExpense.toStringAsFixed(2)}',
        ),
        horizontalSpacing(10),
      ],
    );
  }
}
