part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<TransactionModel> allCategories;

  CategoriesLoaded({required this.allCategories});
}

final class CategoriesTxAdded extends CategoriesState {}

final class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError({required this.message});
}
