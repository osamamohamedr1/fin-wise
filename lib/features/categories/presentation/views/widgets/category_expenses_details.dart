import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_section.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/data/repos/transaction_repository.dart';
import 'package:finance_wise/features/categories/presentation/manger/cubit/category_expenses_cubit.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_expenses_item.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryExpensesDetails extends StatelessWidget {
  final String? category;

  const CategoryExpensesDetails({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryExpensesCubit(TransactionRepositoryImpl())
            ..loadTransactions(category: category),
      child: Scaffold(
        appBar: AppBar(
          title: Text(category ?? 'All Expenses'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          spacing: 12,
          children: [
            verticalSpacing(0),
            const IncomeExpensesSection(),
            const Expanded(
              child: WhiteContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: CategoryExpensesListView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryExpensesListView extends StatelessWidget {
  const CategoryExpensesListView({super.key});

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(10),
                  ...state.groupedTransactions.entries.map(
                    (entry) =>
                        _buildMonthSection(entry.key, context, entry.value),
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
    String month,
    BuildContext context,
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
        verticalSpacing(15),
      ],
    );
  }
}
