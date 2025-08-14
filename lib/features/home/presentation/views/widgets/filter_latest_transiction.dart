import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/toggle_button.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterLastTransactions extends StatefulWidget {
  const FilterLastTransactions({super.key});

  @override
  State<FilterLastTransactions> createState() => _FilterLastTransactionsState();
}

class _FilterLastTransactionsState extends State<FilterLastTransactions> {
  int selectedIndex = 0;

  final List<String> labels = [
    LocaleKeys.daily,
    LocaleKeys.weekly,
    LocaleKeys.monthly,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(labels.length, (index) {
          return ToggleButton(
            label: labels[index].tr(),
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        }),
      ),
    );
  }
}
