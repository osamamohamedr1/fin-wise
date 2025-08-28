import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoTransactionsWidget extends StatelessWidget {
  const NoTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.analytics_outlined,
            size: 48.w,
            color: ColorsManager.darkIcon,
          ),
          verticalSpacing(16),
          Text(
            LocaleKeys.no_transactions.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorsManager.darkIcon,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
