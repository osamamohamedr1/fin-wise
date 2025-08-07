import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/home_info_container.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/income_expenses_section.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/white_container.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundColor: ColorsManager.lightBackground,
              radius: 17,
              child: Center(
                child: Icon(
                  Icons.notifications_outlined,
                  size: 24,
                  color: ColorsManager.darkIcon,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [verticalSpacing(30), HomeInfoContainer()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
