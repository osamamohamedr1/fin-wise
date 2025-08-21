import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LocaleKeys.select_category.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: selectedCategory == null
                    ? FontWeight.normal
                    : FontWeight.w500,
                color: selectedCategory == null
                    ? ColorsManager.mainGreen
                    : ColorsManager.darkIcon,
                fontSize: 14,
              ),
            ),
          ),
          DropdownButton<String>(
            value: selectedCategory,
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
