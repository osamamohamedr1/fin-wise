import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectDateWidget extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateChanged;

  const SelectDateWidget({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.selectedDate != null
                  ? DateFormat(
                      'dd MMM, yyyy',
                      context.locale.languageCode,
                    ).format(widget.selectedDate!)
                  : LocaleKeys.pick_date.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: widget.selectedDate == null
                    ? FontWeight.normal
                    : FontWeight.w500,
                color: widget.selectedDate == null
                    ? ColorsManager.mainGreen
                    : ColorsManager.darkContainer,
              ),
            ),
          ),

          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2050),
              );
              widget.onDateChanged(pickedDate);
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
      ),
    );
  }
}
