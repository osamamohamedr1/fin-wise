import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_number.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IncomeExpensesSection extends StatelessWidget {
  const IncomeExpensesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .8,
      child: Column(
        spacing: 5,
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
              Flexible(
                child: Text(
                  LocaleKeys.percentage_tip.tr(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
