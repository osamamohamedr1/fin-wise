part of 'category_expenses_cubit.dart';

@immutable
sealed class CategoryExpensesState {}

final class CategoryExpensesInitial extends CategoryExpensesState {}

final class CategoryExpensesLoading extends CategoryExpensesState {}

final class CategoryExpensesLoaded extends CategoryExpensesState {
  final Map<String, List<TransactionModel>> groupedTransactions;
  final List<TransactionModel> allTransactions;

  CategoryExpensesLoaded({
    required this.groupedTransactions,
    required this.allTransactions,
  });
}

final class CategoryExpensesError extends CategoryExpensesState {
  final String message;

  CategoryExpensesError({required this.message});
}
