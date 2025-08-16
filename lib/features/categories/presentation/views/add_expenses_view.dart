import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/select_category_row.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/select_date_row.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/expenses_form.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AddExpensesView extends StatefulWidget {
  const AddExpensesView({super.key});

  @override
  State<AddExpensesView> createState() => _AddExpensesViewState();
}

class _AddExpensesViewState extends State<AddExpensesView> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _saveExpense() {
    final amount = amountController.text.trim();
    final title = titleController.text.trim();
    final message = messageController.text.trim();

    if (amount.isEmpty || title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all required fields")),
      );
      return;
    }

    // ✅ You can now send this data to DB / API / State management
    debugPrint("Expense Saved:");
    debugPrint("Amount: $amount");
    debugPrint("Title: $title");
    debugPrint("Message: $message");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.add_expenses.tr()),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        spacing: 12,
        children: [
          verticalSpacing(20),
          Expanded(
            child: WhiteContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(20),
                      titleText(context, LocaleKeys.date.tr()),
                      const SelectDateWidget(),
                      verticalSpacing(8),
                      titleText(context, LocaleKeys.category.tr()),
                      const SelectCategoryRow(),
                      ExpenseForm(
                        amountController: amountController,
                        titleController: titleController,
                        messageController: messageController,
                      ),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _saveExpense();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.mainGreen,
                          ),
                          child: Text(
                            LocaleKeys.save_expense.tr(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text titleText(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
