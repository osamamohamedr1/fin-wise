import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/presentation/manager/transactions_cubit/categories_cubit.dart';
import 'package:finance_wise/features/transictions/presentation/manager/transactions_cubit/transaction_cubit.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryExpensesListDetails extends StatelessWidget {
  const CategoryExpensesListDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoriesError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is CategoriesTxLoaded) {
          if (state.categoryTxList.isEmpty) {
            return const Center(child: Text('No transactions found'));
          }

          return RefreshIndicator(
            onRefresh: () =>
                context.read<TransactionsCubit>().getAllTransactions(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  verticalSpacing(10),
                  ...state.categoryTxList.map(
                    (category) => CategoryExpensesItem(transaction: category),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
