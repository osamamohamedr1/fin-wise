import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SelectCategoryRow extends StatefulWidget {
  final String? selectedCategory;
  final Function(String?) onCategoryChanged;

  const SelectCategoryRow({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  State<SelectCategoryRow> createState() => _SelectCategoryRowState();
}

class _SelectCategoryRowState extends State<SelectCategoryRow> {
  final categories = [
    LocaleKeys.food,
    LocaleKeys.transport,
    LocaleKeys.entertainment,
    LocaleKeys.medical,
    LocaleKeys.groceries,
    LocaleKeys.gifts,
    LocaleKeys.rent,
    LocaleKeys.fother,
  ];

  String _getDisplayText() {
    if (widget.selectedCategory == null) {
      return LocaleKeys.select_category.tr();
    }
    return widget.selectedCategory!.tr();
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
                fontWeight: widget.selectedCategory == null
                    ? FontWeight.normal
                    : FontWeight.w500,
                color: widget.selectedCategory == null
                    ? ColorsManager.mainGreen
                    : isDarkMode
                    ? ColorsManager.lightBackground
                    : ColorsManager.darkBackground,
                fontSize: 14,
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
