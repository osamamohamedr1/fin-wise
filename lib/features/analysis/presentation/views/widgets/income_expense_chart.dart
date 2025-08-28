import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
              color: ColorsManager.darkIcon,
            ),
          ),
          verticalSpacing(20),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 5,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 350.w,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 2500,
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
                          reservedSize: 35,
                          interval: 500,
                          getTitlesWidget: leftTitleWidgets,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 1500,
                            color: ColorsManager.mainGreen,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          BarChartRodData(
                            toY: 1000,
                            color: ColorsManager.blue,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ],
                      ),

                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: 1500,
                            color: ColorsManager.mainGreen,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          BarChartRodData(
                            toY: 1000,
                            color: ColorsManager.blue,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ],
                      ),

                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 1500,
                            color: ColorsManager.mainGreen,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          BarChartRodData(
                            toY: 1000,
                            color: ColorsManager.blue,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ],
                      ),

                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: 1500,
                            color: ColorsManager.mainGreen,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          BarChartRodData(
                            toY: 1000,
                            color: ColorsManager.blue,
                            width: 8.w,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // // Calculate chart width based on number of days in current month
  // double _getChartWidth() {
  //   final now = DateTime.now();
  //   final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
  //   // Give each day about 40 points of width for proper spacing
  //   return daysInMonth * 40.0;
  // }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      color: ColorsManager.darkIcon,
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 500) {
      text = '500';
    } else if (value == 1000) {
      text = '1K';
    } else if (value == 1500) {
      text = '1.5K';
    } else if (value == 2000) {
      text = '2K';
    } else {
      return SizedBox();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 15,
      child: Text(text, style: style),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: ColorsManager.darkIcon,
      fontWeight: FontWeight.w500,
      fontSize: 10.sp,
    );

    final dayNumber = value.toInt() + 1;

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text('$dayNumber', style: style),
    );
  }
}
