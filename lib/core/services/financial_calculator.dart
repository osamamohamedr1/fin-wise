import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FinancialCalculator {
  static double calculateExpensePercentage(double income, double expense) {
    if (income == 0) {
      return 0.0;
    }
    final percentage = expense / income;
    return percentage > 1.0 ? 1.0 : percentage;
  }

  static Color getProgressBarColor(double income, double expense) {
    final percentage = calculateExpensePercentage(income, expense);

    if (percentage <= 0.5) {
      return Colors.green;
    } else if (percentage <= 0.75) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  static int getExpensePercentageAsInt(double income, double expense) {
    return (calculateExpensePercentage(income, expense) * 100).round();
  }

  static String getExpenseTipLocaleKey(double income, double expense) {
    if (income == 0) {
      return LocaleKeys.no_income_recorded;
    }

    final percentage = getExpensePercentageAsInt(income, expense);

    if (percentage <= 50) {
      return LocaleKeys.excellent_savings_rate;
    } else if (percentage <= 75) {
      return LocaleKeys.good_financial_balance;
    } else if (percentage <= 100) {
      return LocaleKeys.consider_reducing_expenses;
    } else {
      return LocaleKeys.budget_review_needed;
    }
  }
}
