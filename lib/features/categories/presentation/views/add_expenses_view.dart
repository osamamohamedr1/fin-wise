import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/extensions.dart';
import 'package:finance_wise/features/categories/presentation/manager/transactions_cubit/categories_cubit.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/select_category_row.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/select_date_row.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/expenses_form.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensesView extends StatefulWidget {
  final String? preSelectedCategory;

  const AddExpensesView({super.key, this.preSelectedCategory});

  @override
  State<AddExpensesView> createState() => _AddExpensesViewState();
}

class _AddExpensesViewState extends State<AddExpensesView> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  DateTime? selectedDate;
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.preSelectedCategory;
  }

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

    if (amount.isEmpty || selectedDate == null || selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LocaleKeys.please_fill_fields.tr())),
      );
      return;
    }

    context.read<CategoriesCubit>().addCategoriestTx(
      txModel: TransactionModel(
        title: title,
        category: selectedCategory!,
        amount: double.tryParse(amount) ?? 0.0,
        date: selectedDate!,
        isExpense: true,
        expensesTitle: title,
        note: message,
      ),
    );
    context.read<HomeCubit>().getNumbersDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
                      SelectDateWidget(
                        selectedDate: selectedDate,
                        onDateChanged: (DateTime? date) {
                          log(date.toString());
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                      verticalSpacing(12),
                      titleText(context, LocaleKeys.category.tr()),
                      SelectCategoryRow(
                        selectedCategory: selectedCategory,
                        onCategoryChanged: (String? category) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      ),
                      verticalSpacing(8),
                      ExpenseForm(
                        amountController: amountController,
                        titleController: titleController,
                        messageController: messageController,
                      ),
                      verticalSpacing(4),
                      Center(
                        child: BlocListener<CategoriesCubit, CategoriesState>(
                          listener: (context, state) {
                            if (state is CategoriesTxAdded) {
                              context.pop();
                              context
                                  .read<CategoriesCubit>()
                                  .getCategoryExpenses(
                                    category: selectedCategory!,
                                  );
                            } else if (state is CategoriesError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            }
                          },
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
