import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleAndNumber extends StatelessWidget {
  const TitleAndNumber({
    super.key,
    required this.isExpense,
    required this.title,
    required this.amount,
  });

  final bool isExpense;
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.locale == Locale('ar') ? 8 : 0,
                right: context.locale == Locale('en') ? 8 : 0,
              ),
              child: SvgPicture.asset(
                !isExpense ? Assets.svgsExpense : Assets.svgsIncome,
                width: 14,
              ),
            ),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Text(
          amount,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isExpense
                ? ColorsManager.blue
                : ColorsManager.lightBackground,
          ),
        ),
      ],
    );
  }
}
