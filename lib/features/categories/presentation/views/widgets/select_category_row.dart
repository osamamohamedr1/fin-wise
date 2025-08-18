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
    LocaleKeys.food.tr(),
    LocaleKeys.transport.tr(),
    LocaleKeys.entertainment.tr(),
    LocaleKeys.medical.tr(),
    LocaleKeys.groceries.tr(),
    LocaleKeys.gifts.tr(),
    LocaleKeys.rent.tr(),
    LocaleKeys.fother.tr(),
  ];

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
              widget.selectedCategory?.tr() ?? LocaleKeys.select_category.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: widget.selectedCategory == null
                    ? FontWeight.normal
                    : FontWeight.w500,
                color: widget.selectedCategory == null
                    ? ColorsManager.mainGreen
                    : ColorsManager.darkIcon,
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
                    value: cat.toLowerCase(),
                    child: dropdownText(cat),
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
