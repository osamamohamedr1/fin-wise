import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/presentation/manger/cubit/category_expenses_cubit.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryExpensesList extends StatelessWidget {
  const CategoryExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryExpensesCubit, CategoryExpensesState>(
      builder: (context, state) {
        if (state is CategoryExpensesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoryExpensesError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${state.message}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context
                      .read<CategoryExpensesCubit>()
                      .refreshTransactions(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is CategoryExpensesLoaded) {
          if (state.groupedTransactions.isEmpty) {
            return const Center(child: Text('No transactions found'));
          }

          return RefreshIndicator(
            onRefresh: () =>
                context.read<CategoryExpensesCubit>().refreshTransactions(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  verticalSpacing(10),
                  ...state.groupedTransactions.entries.map(
                    (entry) =>
                        _buildMonthSection(context, entry.key, entry.value),
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

  Widget _buildMonthSection(
    BuildContext context,
    String month,
    List<TransactionModel> transactions,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(month, style: Theme.of(context).textTheme.bodyLarge),
        verticalSpacing(10),
        ...transactions.map(
          (transaction) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CategoryExpensesItem(transaction: transaction),
          ),
        ),
        verticalSpacing(10),
      ],
    );
  }
}
