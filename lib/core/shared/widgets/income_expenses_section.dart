import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/services/financial_calculator.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_number.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

class IncomeExpensesSection extends StatelessWidget {
  const IncomeExpensesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .8,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is NumbersLoaded) {
            return Column(
              spacing: 5,
              children: [
                IncomeExpensesNumber(
                  totalBalance: state.balance,
                  totalExpense: state.expense,
                ),
                Stack(
                  children: [
                    LinearProgressIndicator(
                      minHeight: 27,
                      borderRadius: BorderRadius.circular(16),
                      semanticsLabel: 'Expense Progress Indicator',
                      value: FinancialCalculator.calculateExpensePercentage(
                        state.income,
                        state.expense,
                      ),
                      backgroundColor: isDarkMode
                          ? ColorsManager.darkBottomBar
                          : ColorsManager.lightBackground,
                      color: isDarkMode
                          ? ColorsManager.mainGreen
                          : ColorsManager.darkContainer,
                    ),

                    Positioned(
                      right: 20,
                      top: 4,
                      child: Text(
                        '${FinancialCalculator.getExpensePercentageAsInt(state.income, state.expense)}%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: !isDarkMode
                              ? ColorsManager.darkContainer
                              : ColorsManager.lightBackground,
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset(Assets.svgsCheck, width: 16),
                    ),
                    Flexible(
                      child: Text(
                        _getLocalizedExpenseTip(state.income, state.expense),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return CircularProgressIndicator(
              color: ColorsManager.mainGreen,
              strokeWidth: 2,
            );
          }
        },
      ),
    );
  }

  String _getLocalizedExpenseTip(double income, double expense) {
    final localeKey = FinancialCalculator.getExpenseTipLocaleKey(
      income,
      expense,
    );
    final percentage = FinancialCalculator.getExpensePercentageAsInt(
      income,
      expense,
    );

    if (income == 0) {
      return localeKey.tr();
    }

    return localeKey.tr(namedArgs: {'percentage': percentage.toString()});
  }
}
