import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/constants.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionsRepo {
  var txBox = Hive.box<TransactionModel>(transactionsBox);

  Future<List<TransactionModel>> getIncomeTransactions() async {
    final transactions = txBox.values.where((tx) => !tx.isExpense).toList();
    // Sort by date in descending order (newest first)
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> getExpensesTransactions() async {
    final transactions = txBox.values.where((tx) => tx.isExpense).toList();
    // Sort by date in descending order (newest first)
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    final transactions = txBox.values.toList();
    // Sort by date in descending order (newest first)
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
    // Sort by date in descending order (newest first)
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }
}
