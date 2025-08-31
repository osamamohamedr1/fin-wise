import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/routing/routes.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/extensions.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/saving_card_widget.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeStatusCards extends StatelessWidget {
  const HomeStatusCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.savingsView);
                },
                child: SavingCardWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(Assets.svgsVline, height: 110),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(Assets.svgsSalary, width: 31),
                    title: Text(
                      LocaleKeys.revenue_last_month.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      state is NumbersLoaded
                          ? '\$ ${state.lastMonthRevenue.toStringAsFixed(2)}'
                          : '\$ 0.00',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SvgPicture.asset(Assets.svgsHline),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(Assets.svgsIncome, width: 21),
                    title: Text(
                      LocaleKeys.expenses_last_month.tr(),
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Text(
                      state is NumbersLoaded
                          ? '-\$ ${state.lastMonthExpenses.toStringAsFixed(2)}'
                          : '-\$ 0.00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
