import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/services/transaction_service.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_transactions_cubit.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/filter_latest_transiction.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/home_filtered_list.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/home_info_container.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_section.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeTransactionsCubit(TransactionsService()),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.welcome.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                LocaleKeys.quote.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(LocaleKeys.coming_soon.tr())),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CircleAvatar(
                  backgroundColor: ColorsManager.lightBackground,
                  radius: 17,
                  child: Center(
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 24,
                      color: ColorsManager.darkContainer,
                    ),
                  ),
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            IncomeExpensesSection(),
            SizedBox(height: 16),
            Expanded(
              child: WhiteContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        verticalSpacing(8),
                        HomeInfoContainer(),
                        FilterLastTransactions(),
                        HomeFilteredTransactions(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
