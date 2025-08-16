import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/categories/presentation/views/widgets/custom_text_field.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({
    super.key,
    required this.amountController,
    required this.titleController,
    required this.messageController,
  });
  final TextEditingController amountController;
  final TextEditingController titleController;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(1),
        titleText(context, LocaleKeys.amount.tr()),
        CustomTextField(
          hintText: LocaleKeys.enter_amount.tr(),
          controller: amountController,
          keyboardType: TextInputType.number,
        ),
        verticalSpacing(8),
        titleText(context, LocaleKeys.expense_title.tr()),

        CustomTextField(
          hintText: LocaleKeys.expense_title_hint.tr(),
          controller: titleController,
        ),
        verticalSpacing(10),
        CustomTextField(
          hintText: LocaleKeys.enter_message.tr(),
          controller: messageController,
          maxLines: 5,
        ),
      ],
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
