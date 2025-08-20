import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/routes.dart';
import 'package:finance_wise/features/transictions/presentation/manager/transactions_cubit/transaction_cubit.dart';
import 'package:finance_wise/core/shared/widgets/select_transiction_date_row.dart';
import 'package:finance_wise/core/shared/widgets/transaction_list_item.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/total_balance_row.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/transaction_type_row.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addIncome);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          LocaleKeys.transaction.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is NumbersLoaded) {
                  return Column(
                    spacing: 16,
                    children: [
                      TotalBalanceRow(totalBalance: state.balance),
                      TransactionTypeRow(
                        income: state.income,
                        expense: state.expense,
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          verticalSpacing(16),
          Expanded(
            child: WhiteContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    verticalSpacing(16),
                    SelectTransictionDate(),
                    verticalSpacing(8),
                    BlocBuilder<TransactionsCubit, TransactionsState>(
                      builder: (context, state) {
                        if (state is TransactionsLoading) {
                          return const Expanded(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (state is TransactionsLoaded) {
                          if (state.allTransactions.isEmpty) {
                            return Expanded(child: NoTransacionsWidget());
                          }
                          return Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: state.allTransactions.length,
                              itemBuilder: (context, index) {
                                return TransactionListItem(
                                  transaction: state.allTransactions[index],
                                );
                              },
                            ),
                          );
                        } else if (state is TransactionsError) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                state.message,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: Center(
                              child: Text(LocaleKeys.no_transactions.tr()),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoTransacionsWidget extends StatelessWidget {
  const NoTransacionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          verticalSpacing(16),
          Text(
            LocaleKeys.no_transactions.tr(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
