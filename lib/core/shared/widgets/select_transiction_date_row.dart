import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/transactions/presentation/manager/transactions_cubit/transaction_cubit.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class SelectTransictionDate extends StatefulWidget {
  const SelectTransictionDate({super.key});

  @override
  State<SelectTransictionDate> createState() => _SelectTransictionDateState();
}

class _SelectTransictionDateState extends State<SelectTransictionDate> {
  DateTime? selectedDate;

  void _resetFilter() {
    setState(() {
      selectedDate = null;
    });
    context.read<TransactionsCubit>().getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: selectedDate != null ? _resetFilter : null,
          child: Row(
            children: [
              selectedDate == null
                  ? Text(
                      LocaleKeys.all_transactions.tr(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: selectedDate != null
                            ? ColorsManager.mainGreen
                            : null,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateFormat(
                            'MMM, yyyy',
                            context.locale.languageCode,
                          ).format(selectedDate!),
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: ColorsManager.mainGreen),
                        ),
                        horizontalSpacing(8),
                        Icon(
                          Icons.clear,
                          size: 18,
                          color: ColorsManager.mainGreen,
                        ),
                      ],
                    ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showMonthPicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
            ).then((date) {
              if (date != null) {
                setState(() {
                  selectedDate = date;
                });

                context.read<TransactionsCubit>().filterTransactionsByMonth(
                  date,
                );
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: ColorsManager.mainGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: SvgPicture.asset(Assets.svgsCalender, width: 20),
          ),
        ),
      ],
    );
  }
}
