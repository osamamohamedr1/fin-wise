import 'package:collection/collection.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/services/transaction_service.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisRepo {
  TransactionsService service = TransactionsService();

  Future<List<BarChartGroupData>> getDailyBarGroups(DateTime month) async {
    final dailyTotals = await getDailyTotalsForMonth(month);

    final List<BarChartGroupData> barGroups = [];

    int x = 0;
    final sortedKeys = dailyTotals.keys.toList()
      ..sort((a, b) => a.compareTo(b));

    for (final day in sortedKeys) {
      final totals = dailyTotals[day]!;

      barGroups.add(
        BarChartGroupData(
          x: x,

          barRods: [
            BarChartRodData(
              toY: totals["income"]!,
              color: ColorsManager.mainGreen,
              width: 6.w,
              borderRadius: BorderRadius.circular(4.r),
            ),
            BarChartRodData(
              toY: totals["expense"]!,
              color: ColorsManager.blue,
              width: 6.w,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ],
        ),
      );

      x++;
    }

    return barGroups;
  }

  Future<Map<String, double>> getCurrentMonthTotals(DateTime month) async {
    final transactions = await service.filterTransactionsByMonth(month);

    final totalIncome = transactions
        .where((tx) => !tx.isExpense)
        .fold<double>(0, (sum, tx) => sum + tx.amount);

    final totalExpense = transactions
        .where((tx) => tx.isExpense)
        .fold<double>(0, (sum, tx) => sum + tx.amount);

    return {"income": totalIncome, "expense": totalExpense};
  }

  Future<Map<DateTime, Map<String, double>>> getDailyTotalsForMonth(
    DateTime month,
  ) async {
    final transactions = await service.filterTransactionsByMonth(month);

    final grouped = groupBy(
      transactions,
      (TransactionModel tx) =>
          DateTime(tx.date.year, tx.date.month, tx.date.day),
    );

    final Map<DateTime, Map<String, double>> result = {};

    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      final currentDay = DateTime(month.year, month.month, day);
      result[currentDay] = {"income": 0.0, "expense": 0.0};
    }

    grouped.forEach((day, txs) {
      final income = txs
          .where((tx) => !tx.isExpense)
          .fold<double>(0, (sum, tx) => sum + tx.amount);

      final expense = txs
          .where((tx) => tx.isExpense)
          .fold<double>(0, (sum, tx) => sum + tx.amount);

      result[day] = {"income": income, "expense": expense};
    });

    return result;
  }
}
