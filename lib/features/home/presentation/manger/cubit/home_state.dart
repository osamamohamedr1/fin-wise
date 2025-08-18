part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class NumbersLoading extends HomeState {}

final class NumbersLoaded extends HomeState {
  NumbersLoaded(this.balance, this.expense, this.income);
  final double balance;
  final double expense;
  final double income;
}

final class HomeError extends HomeState {
  HomeError({required this.message});
  final String message;
}
