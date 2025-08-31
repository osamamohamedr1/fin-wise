import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/constants.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionsService {
  var txBox = Hive.box<TransactionModel>(transactionsBox);

  Future<void> addTransaction({required TransactionModel txModel}) async {
    txBox.add(txModel);
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    final transactions = txBox.values.toList();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> filterTransactionsByCategories(
    String category,
  ) async {
    final transactions = txBox.values
        .where((tx) => tx.category == category)
        .toList();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> filterTransactionsByMonth(
    DateTime month,
  ) async {
    final transactions = txBox.values
        .where(
          (tx) => tx.date.month == month.month && tx.date.year == month.year,
        )
        .toList();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> getIncomeTransactions() async {
    final transactions = txBox.values.where((tx) => !tx.isExpense).toList();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> getExpenseTransactions() async {
    final transactions = txBox.values.where((tx) => tx.isExpense).toList();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> getDailyTransactions() async {
    final now = DateTime.now();

    final transactions = txBox.values
        .where(
          (tx) =>
              tx.date.year == now.year &&
              tx.date.month == now.month &&
              tx.date.day == now.day,
        )
        .toList();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> getWeeklyTransactions() async {
    final now = DateTime.now();
    final last7Days = now.subtract(const Duration(days: 7));

    final transactions = txBox.values
        .where((tx) => tx.date.isAfter(last7Days) && tx.date.isBefore(now))
        .toList();

    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> getMonthlyTransactions() async {
    final now = DateTime.now();

    final transactions = txBox.values
        .where((tx) => tx.date.year == now.year && tx.date.month == now.month)
        .toList();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<double> getTotalExpenses() async {
    final expenses = txBox.values.where((e) => e.isExpense);
    return expenses.fold<double>(0, (sum, tx) => sum + tx.amount);
  }

  Future<double> getTotalIncome() async {
    final income = txBox.values.where((e) => !e.isExpense);
    return income.fold<double>(0, (sum, tx) => sum + tx.amount);
  }

  Future<double> getTotalBalance() async {
    final income = txBox.values.where((e) => !e.isExpense);
    final expenses = txBox.values.where((e) => e.isExpense);
    return income.fold<double>(0, (sum, tx) => sum + tx.amount) -
        expenses.fold<double>(0, (sum, tx) => sum + tx.amount);
  }

  Future<double> getLastMonthRevenue() async {
    final now = DateTime.now();

    final lastMonthYear = now.month == 1 ? now.year - 1 : now.year;
    final lastMonthMonth = now.month == 1 ? 12 : now.month - 1;

    final lastMonthIncome = txBox.values
        .where(
          (tx) =>
              !tx.isExpense &&
              tx.date.year == lastMonthYear &&
              tx.date.month == lastMonthMonth,
        )
        .toList();

    return lastMonthIncome.fold<double>(0, (sum, tx) => sum + tx.amount);
  }

  Future<double> getLastMonthExpenses() async {
    final now = DateTime.now();

    final lastMonthYear = now.month == 1 ? now.year - 1 : now.year;
    final lastMonthMonth = now.month == 1 ? 12 : now.month - 1;

    final lastMonthExpenses = txBox.values
        .where(
          (tx) =>
              tx.isExpense &&
              tx.date.year == lastMonthYear &&
              tx.date.month == lastMonthMonth,
        )
        .toList();

    return lastMonthExpenses.fold<double>(0, (sum, tx) => sum + tx.amount);
  }
}
