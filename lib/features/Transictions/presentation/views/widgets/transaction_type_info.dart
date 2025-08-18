import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class TransactionTypeInfo extends StatelessWidget {
  const TransactionTypeInfo({
    super.key,
    required this.isExpense,
    required this.title,
    required this.amount,
    required this.isSelected,
  });

  final bool isExpense;
  final String title;
  final String amount;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),

      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.blue : ColorsManager.lightBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            !isExpense ? Assets.svgsExpense : Assets.svgsIncome,
            width: 22,
            colorFilter: ColorFilter.mode(
              !isSelected
                  ? (isExpense ? ColorsManager.darkIcon : ColorsManager.blue)
                  : Colors.white,
              BlendMode.srcIn,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isSelected ? Colors.white : null,
            ),
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: !isSelected
                  ? isExpense
                        ? ColorsManager.blue
                        : ColorsManager.darkIcon
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
