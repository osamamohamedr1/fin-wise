import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/analysis/presentation/views/widgets/tx_summry_cards.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AnalysisSummaryCards extends StatelessWidget {
  const AnalysisSummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SummaryCard(
            title: LocaleKeys.income.tr(),
            amount: '\$4,120.00',
            icon: Assets.svgsIncome,
            color: ColorsManager.mainGreen,
          ),
        ),
        horizontalSpacing(20),
        Expanded(
          child: SummaryCard(
            title: LocaleKeys.expense.tr(),
            amount: '\$1,187.40',
            icon: Assets.svgsExpense,
            color: ColorsManager.blue,
          ),
        ),
      ],
    );
  }
}
