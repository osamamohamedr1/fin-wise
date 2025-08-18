import 'package:easy_localization/easy_localization.dart';
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
            child: Column(
              spacing: 16,
              children: [TotalBalanceRow(), TransactionTypeRow()],
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
                        if (state is TransactionsLoaded) {
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
                        } else {
                          return CircularProgressIndicator();
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
