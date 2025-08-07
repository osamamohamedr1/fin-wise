import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/income_expenses_header.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IncomeExpensesSection extends StatelessWidget {
  const IncomeExpensesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .85,
      child: Column(
        spacing: 20,
        children: [
          IncomeExpensesNumber(),
          Stack(
            children: [
              LinearProgressIndicator(
                minHeight: 27,
                borderRadius: BorderRadius.circular(16),
                semanticsLabel: 'Progress Indicator',
                semanticsValue: '70%',

                value: 0.7,
                backgroundColor: Colors.white,
                color: ColorsManager.darkBackground,
              ),

              Positioned(
                right: 20,
                top: 4,
                child: Text(
                  '\$20,000',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsManager.darkIcon,
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(Assets.svgsCheck, width: 16),
              ),
              Text(
                LocaleKeys.percentage_tip.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
