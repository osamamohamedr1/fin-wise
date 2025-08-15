import 'package:bloc/bloc.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/features/categories/data/repos/transaction_repository.dart';
import 'package:flutter/material.dart';

part 'category_expenses_state.dart';

class CategoryExpensesCubit extends Cubit<CategoryExpensesState> {
  final TransactionRepository _repository;

  CategoryExpensesCubit(this._repository) : super(CategoryExpensesInitial());

  Future<void> loadTransactions({String? category}) async {
    emit(CategoryExpensesLoading());

    try {
      final groupedTransactions = await _repository
          .getTransactionsGroupedByMonth();
      final allTransactions = await _repository.getAllTransactions();

      // If category is specified, filter transactions
      if (category != null && category.isNotEmpty) {
        final filteredTransactions = allTransactions
            .where(
              (transaction) =>
                  transaction.category.toLowerCase() == category.toLowerCase(),
            )
            .toList();

        // Re-group filtered transactions
        final Map<String, List<TransactionModel>> filteredGrouped = {};
        for (final transaction in filteredTransactions) {
          final monthYear = _getMonthYear(transaction.date);
          if (!filteredGrouped.containsKey(monthYear)) {
            filteredGrouped[monthYear] = [];
          }
          filteredGrouped[monthYear]!.add(transaction);
        }

        // Sort within each month
        filteredGrouped.forEach((key, value) {
          value.sort((a, b) => b.date.compareTo(a.date));
        });

        emit(
          CategoryExpensesLoaded(
            groupedTransactions: filteredGrouped,
            allTransactions: filteredTransactions,
          ),
        );
      } else {
        emit(
          CategoryExpensesLoaded(
            groupedTransactions: groupedTransactions,
            allTransactions: allTransactions,
          ),
        );
      }
    } catch (e) {
      emit(CategoryExpensesError(message: e.toString()));
    }
  }

  Future<void> refreshTransactions({String? category}) async {
    await loadTransactions(category: category);
  }

  String _getMonthYear(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
