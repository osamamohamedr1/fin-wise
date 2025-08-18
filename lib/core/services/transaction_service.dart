import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/constants.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionsService {
  var txBox = Hive.box<TransactionModel>(transactionsBox);

  Future<void> addTransaction({required TransactionModel txModel}) async {
    txBox.add(txModel);
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    return txBox.values.toList();
  }

  Future<List<TransactionModel>> filterTransactionsByCategories(
    String category,
  ) async {
    return txBox.values.where((tx) => tx.category == category).toList();
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
}
