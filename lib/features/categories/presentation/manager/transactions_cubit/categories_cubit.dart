import 'package:bloc/bloc.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/services/transaction_service.dart';
import 'package:flutter/material.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final TransactionsService transactionsService;

  CategoriesCubit(this.transactionsService) : super(CategoriesInitial());

  Future<void> getAllCategories() async {
    try {
      var result = await transactionsService.getAllTransactions();

      emit(CategoriesLoaded(allCategories: result));
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }

  Future<void> addCategoriestTx({required TransactionModel txModel}) async {
    try {
      await transactionsService.addTransaction(txModel: txModel);
      emit(CategoriesTxAdded());
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }
}
