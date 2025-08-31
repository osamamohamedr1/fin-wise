import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/extensions.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:finance_wise/features/transictions/presentation/manager/transactions_cubit/transaction_cubit.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/select_income_category_row.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/select_date_row.dart';
import 'package:finance_wise/features/transictions/presentation/views/widgets/income_form.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddIncomeView extends StatefulWidget {
  const AddIncomeView({super.key});

  @override
  State<AddIncomeView> createState() => _AddIncomeViewState();
}

class _AddIncomeViewState extends State<AddIncomeView> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  DateTime? selectedDate;
  String? selectedCategory;

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _saveIncome() async {
    final amount = amountController.text.trim();
    final title = titleController.text.trim();
    final message = messageController.text.trim();

    if (amount.isEmpty || selectedDate == null || selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all required fields")),
      );
      return;
    }

    await context.read<TransactionsCubit>().addTransactions(
      txModel: TransactionModel(
        title: title,
        category: selectedCategory!,
        amount: double.tryParse(amount) ?? 0.0,
        date: selectedDate!,
        isExpense: false,
        expensesTitle: title,
        note: message,
      ),
    );
    await context.read<HomeCubit>().getNumbersDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.income.tr()),
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
                      SelectIncomeCategoryRow(
                        onCategoryChanged: (String? category) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      ),
                      verticalSpacing(8),
                      IncomeForm(
                        amountController: amountController,
                        titleController: titleController,
                        messageController: messageController,
                      ),
                      verticalSpacing(4),
                      Center(
                        child: BlocListener<TransactionsCubit, TransactionsState>(
                          listener: (context, state) {
                            if (state is TransactionsAdded) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${LocaleKeys.income.tr()} saved successfully!",
                                  ),
                                ),
                              );
                              context.pop();
                              context
                                  .read<TransactionsCubit>()
                                  .getAllTransactions();
                            } else if (state is TransactionsError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            }
                          },
                          child: ElevatedButton(
                            onPressed: () {
                              _saveIncome();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.mainGreen,
                            ),
                            child: Text(
                              LocaleKeys.income.tr(),
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
