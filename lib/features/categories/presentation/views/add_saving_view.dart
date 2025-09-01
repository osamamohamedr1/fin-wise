import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_section.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/core/models/category_item_model.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/category_item.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AddSavingsView extends StatelessWidget {
  const AddSavingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.savings.tr())),
      body: Column(
        children: [
          IncomeExpensesSection(),
          verticalSpacing(14),
          Expanded(
            child: WhiteContainer(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                itemCount: savingsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: MediaQuery.sizeOf(context).width * 0.34,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(LocaleKeys.coming_soon.tr())),
                      );
                    },
                    child: CategoryCard(category: savingsList[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
