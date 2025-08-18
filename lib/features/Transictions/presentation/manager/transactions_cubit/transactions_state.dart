part of 'transaction_cubit.dart';

@immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsLoaded extends TransactionsState {
  final List<TransactionModel> allTransactions;

  TransactionsLoaded({required this.allTransactions});
}

final class TransactionsAdded extends TransactionsState {}

final class TransactionsError extends TransactionsState {
  final String message;

  TransactionsError({required this.message});
}
