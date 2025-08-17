import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TotalBalanceRow extends StatelessWidget {
  const TotalBalanceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.lightBackground,

        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 2,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.total_balance.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          Text('\$20,7550.0', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
