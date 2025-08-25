import 'package:bloc/bloc.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/services/transaction_service.dart';
import 'package:flutter/material.dart';

part 'home_transactions_state.dart';

enum FilterPeriod { daily, weekly, monthly }

class HomeTransactionsCubit extends Cubit<HomeTransactionsState> {
  final TransactionsService transactionsService;

  HomeTransactionsCubit(this.transactionsService)
    : super(HomeTransactionsInitial());

  Future<void> getFilteredTransactions(FilterPeriod period) async {
    try {
      emit(HomeTransactionsLoading());
      List<TransactionModel> result;

      switch (period) {
        case FilterPeriod.daily:
          result = await transactionsService.getDailyTransactions();
          break;
        case FilterPeriod.weekly:
          result = await transactionsService.getWeeklyTransactions();
          break;
        case FilterPeriod.monthly:
          result = await transactionsService.getMonthlyTransactions();
          break;
      }

      emit(HomeTransactionsLoaded(transactions: result, currentPeriod: period));
    } catch (e) {
      emit(HomeTransactionsError(message: e.toString()));
    }
  }

  Future<void> getAllTransactions() async {
    try {
      emit(HomeTransactionsLoading());
      var result = await transactionsService.getAllTransactions();
      emit(HomeTransactionsLoaded(transactions: result, currentPeriod: null));
    } catch (e) {
      emit(HomeTransactionsError(message: e.toString()));
    }
  }
}
