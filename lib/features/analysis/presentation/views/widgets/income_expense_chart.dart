import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/shared/widgets/no_transactions_widget.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/analysis/data/repos/chart_helper_funs.dart';
import 'package:finance_wise/features/analysis/presentation/manager/cubit/analysis_cubit.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomeExpenseChart extends StatelessWidget {
  final Function(DateTime?)? onDateChanged;

  const IncomeExpenseChart({super.key, this.onDateChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${LocaleKeys.income.tr()} & ${LocaleKeys.expense.tr()}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorsManager.darkContainer,
            ),
          ),
          verticalSpacing(20),
          SizedBox(
            height:
                MediaQuery.sizeOf(context).height *
                0.28, // Increased height for better tooltip space
            width: double.infinity,
            child: BlocBuilder<AnalysisCubit, AnalysisState>(
              builder: (context, state) {
                if (state is AnalysisLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AnalysisLoaded) {
                  if (!_hasValidData(state.barGroups)) {
                    return const NoTransactionsWidget();
                  }

                  final maxValue = ChartHelperFuns.calculateMaxValue(
                    state.barGroups,
                  );
                  final responsiveMaxY = ChartHelperFuns.getResponsiveMaxY(
                    maxValue,
                  );
                  final responsiveInterval =
                      ChartHelperFuns.getResponsiveInterval(responsiveMaxY);

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Container(
                      width: 750,
                      padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: responsiveMaxY + 4000,
                          minY: 0,
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: getTitles,
                                reservedSize: 38,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,

                                interval: responsiveInterval,
                                getTitlesWidget: (value, meta) =>
                                    leftTitleWidgets(value, meta),
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: responsiveInterval,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey.shade300,
                                strokeWidth: 1,
                              );
                            },
                          ),
                          barGroups: state.barGroups,
                          groupsSpace: 8.w,
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              getTooltipColor: (group) => Colors.black87,
                              tooltipRoundedRadius: 8,
                              tooltipPadding: EdgeInsets.all(8.w),
                              fitInsideHorizontally: true,
                              fitInsideVertically: true,
                              tooltipMargin: 12,
                              direction: TooltipDirection.auto,
                              getTooltipItem:
                                  (group, groupIndex, rod, rodIndex) {
                                    final isIncome = rodIndex == 0;
                                    final type = isIncome
                                        ? LocaleKeys.income.tr()
                                        : LocaleKeys.expense.tr();
                                    return BarTooltipItem(
                                      '$type\n\$${rod.toY.toStringAsFixed(0)}',
                                      TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                      ),
                                    );
                                  },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is AnalysisError) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      color: ColorsManager.darkContainer,
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
    );

    String text = '';

    if (value == 0) {
      text = '0';
    } else if (value < 1000) {
      text = value.toInt().toString();
    } else if (value < 1000000) {
      final kValue = value / 1000;
      if (kValue == kValue.toInt()) {
        text = '${kValue.toInt()}K';
      } else {
        text = '${kValue.toStringAsFixed(1)}K';
      }
    } else {
      final mValue = value / 1000000;
      if (mValue == mValue.toInt()) {
        text = '${mValue.toInt()}M';
      } else {
        text = '${mValue.toStringAsFixed(1)}M';
      }
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 15,
      child: Text(text, style: style),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: ColorsManager.darkContainer,
      fontWeight: FontWeight.w500,
      fontSize: 9.sp,
    );

    final dayNumber = value.toInt() + 1;

    if (dayNumber % 2 == 0 || dayNumber == 1) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16,
        child: Text('$dayNumber', style: style),
      );
    }

    return const SizedBox.shrink();
  }

  bool _hasValidData(List<BarChartGroupData> barGroups) {
    if (barGroups.isEmpty) return false;

    return barGroups.any((group) => group.barRods.any((rod) => rod.toY > 0));
  }
}
