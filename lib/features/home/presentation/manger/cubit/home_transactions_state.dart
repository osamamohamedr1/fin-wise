part of 'home_transactions_cubit.dart';

@immutable
sealed class HomeTransactionsState {}

final class HomeTransactionsInitial extends HomeTransactionsState {}

final class HomeTransactionsLoading extends HomeTransactionsState {}

final class HomeTransactionsLoaded extends HomeTransactionsState {
  final List<TransactionModel> transactions;
  final FilterPeriod? currentPeriod;

  HomeTransactionsLoaded({required this.transactions, this.currentPeriod});
}

final class HomeTransactionsError extends HomeTransactionsState {
  final String message;

  HomeTransactionsError({required this.message});
}
