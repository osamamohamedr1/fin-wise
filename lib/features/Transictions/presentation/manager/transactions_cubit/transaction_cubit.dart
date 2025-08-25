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
      emit(TransactionsLoading());
      var result = await transactionService.getAllTransactions();
      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> filterTransactionsByMonth(DateTime month) async {
    try {
      emit(TransactionsLoading());
      var result = await transactionService.filterTransactionsByMonth(month);
      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> getIncomeTransactions() async {
    try {
      emit(TransactionsLoading());
      var result = await transactionService.getIncomeTransactions();
      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> getExpenseTransactions() async {
    try {
      emit(TransactionsLoading());
      var result = await transactionService.getExpenseTransactions();
      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> getDailyTransactions() async {
    try {
      emit(TransactionsLoading());
      var result = await transactionService.getDailyTransactions();
      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> getWeeklyTransactions() async {
    try {
      emit(TransactionsLoading());
      var result = await transactionService.getWeeklyTransactions();
      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> getMonthlyTransactions() async {
    try {
      emit(TransactionsLoading());
      var result = await transactionService.getMonthlyTransactions();
      emit(TransactionsLoaded(allTransactions: result));
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }

  Future<void> addTransactions({required TransactionModel txModel}) async {
    try {
      await transactionService.addTransaction(txModel: txModel);
      emit(TransactionsAdded());

      getAllTransactions();
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }
}
