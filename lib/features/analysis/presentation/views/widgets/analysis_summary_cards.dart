import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/analysis/presentation/manager/cubit/analysis_cubit.dart';
import 'package:finance_wise/features/analysis/presentation/views/widgets/tx_summry_cards.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisSummaryCards extends StatelessWidget {
  const AnalysisSummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      builder: (context, state) {
        String incomeAmount = '\$0.00';
        String expenseAmount = '\$0.00';
        if (state is AnalysisLoaded) {
          incomeAmount = _formatCurrency(state.totalIncome);
          expenseAmount = _formatCurrency(state.totalExpense);
        }

        return Row(
          children: [
            Expanded(
              child: SummaryCard(
                title: LocaleKeys.income.tr(),
                amount: incomeAmount,
                icon: Assets.svgsIncome,
                color: ColorsManager.mainGreen,
              ),
            ),
            horizontalSpacing(20),
            Expanded(
              child: SummaryCard(
                title: LocaleKeys.expense.tr(),
                amount: expenseAmount,
                icon: Assets.svgsExpense,
                color: ColorsManager.blue,
              ),
            ),
          ],
        );
      },
    );
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000000) {
      return '\$${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      if (amount >= 10000) {
        return '\$${(amount / 1000).toStringAsFixed(0)}K';
      } else {
        return '\$${(amount / 1000).toStringAsFixed(1)}K';
      }
    } else {
      return '\$${amount.toStringAsFixed(2)}';
    }
  }
}
