import 'package:finance_wise/core/shared/widgets/transactions_list.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFilteredTransactions extends StatelessWidget {
  const HomeFilteredTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTransactionsCubit, HomeTransactionsState>(
      builder: (context, state) {
        if (state is HomeTransactionsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeTransactionsLoaded) {
          return TransactionsList(transactions: state.transactions);
        } else if (state is HomeTransactionsError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
