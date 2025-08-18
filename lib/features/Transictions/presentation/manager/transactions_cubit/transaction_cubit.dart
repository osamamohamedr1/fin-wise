import 'package:bloc/bloc.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/services/transaction_service.dart';
import 'package:flutter/material.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionsService transactionService;

  TransactionsCubit(this.transactionService) : super(TransactionsInitial());

  Future<void> getAllTransactions() async {
    try {
      var result = await transactionService.getAllTransactions();

      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> addTransactions({required TransactionModel txModel}) async {
    try {
      await transactionService.addTransaction(txModel: txModel);
      emit(TransactionsAdded());
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }
}
