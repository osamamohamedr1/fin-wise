import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class SelectTransictionDate extends StatefulWidget {
  const SelectTransictionDate({super.key});

  @override
  State<SelectTransictionDate> createState() => _SelectTransictionDateState();
}

class _SelectTransictionDateState extends State<SelectTransictionDate> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedDate == null
              ? DateFormat(
                  'MMM, yyyy',
                  context.locale.languageCode,
                ).format(DateTime.now())
              : DateFormat(
                  'MMM, yyyy',
                  context.locale.languageCode,
                ).format(selectedDate!),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        GestureDetector(
          onTap: () {
            showMonthPicker(context: context, initialDate: DateTime.now()).then(
              (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            );
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
