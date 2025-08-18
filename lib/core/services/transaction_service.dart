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
}
