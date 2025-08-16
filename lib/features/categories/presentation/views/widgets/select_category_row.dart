import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SelectCategoryRow extends StatefulWidget {
  const SelectCategoryRow({super.key});

  @override
  State<SelectCategoryRow> createState() => _SelectCategoryRowState();
}

class _SelectCategoryRowState extends State<SelectCategoryRow> {
  String? selectedCategory;

  final categories = [
    LocaleKeys.food.tr(),
    LocaleKeys.transport.tr(),
    LocaleKeys.entertainment.tr(),
    LocaleKeys.medical.tr(),
    LocaleKeys.groceries.tr(),
    LocaleKeys.gifts.tr(),
    LocaleKeys.rent.tr(),
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
              'Select Category',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
          DropdownButton<String>(
            value: selectedCategory,
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
