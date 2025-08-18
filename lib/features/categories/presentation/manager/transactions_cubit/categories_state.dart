part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesTxLoaded extends CategoriesState {
  final List<TransactionModel> categoryTxList;

  CategoriesTxLoaded({required this.categoryTxList});
}

final class CategoriesTxAdded extends CategoriesState {}

final class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError({required this.message});
}
