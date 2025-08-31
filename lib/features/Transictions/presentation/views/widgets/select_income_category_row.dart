import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectIncomeCategoryRow extends StatefulWidget {
  final Function(String?) onCategoryChanged;

  const SelectIncomeCategoryRow({super.key, required this.onCategoryChanged});

  @override
  State<SelectIncomeCategoryRow> createState() =>
      _SelectIncomeCategoryRowState();
}

class _SelectIncomeCategoryRowState extends State<SelectIncomeCategoryRow> {
  final categories = [
    LocaleKeys.salary,
    LocaleKeys.freelance,
    LocaleKeys.fother,
  ];
  String? selectedCategory;

  String _getDisplayText() {
    if (selectedCategory == null) {
      return LocaleKeys.select_category.tr();
    }
    return selectedCategory!.tr();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isDarkMode
            ? ColorsManager.darkBackground
            : ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _getDisplayText(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: selectedCategory == null
                    ? ColorsManager.mainGreen
                    : isDarkMode
                    ? ColorsManager.lightBackground
                    : ColorsManager.mainGreen,

                fontSize: 14.sp,
              ),
            ),
          ),
          DropdownButton<String>(
            value: null,
            underline: const SizedBox.shrink(),
            items: categories
                .map(
                  (cat) => DropdownMenuItem(
                    value: cat,
                    child: dropdownText(cat.tr()),
                  ),
                )
                .toList(),
            onChanged: (newValue) {
              widget.onCategoryChanged(newValue);

              setState(() {
                selectedCategory = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  Text dropdownText(String text) => Text(
    text,
    style: Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
  );
}
