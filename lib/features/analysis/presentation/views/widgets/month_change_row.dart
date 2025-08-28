import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class MonthChangeRow extends StatefulWidget {
  const MonthChangeRow({super.key});

  @override
  State<MonthChangeRow> createState() => _MonthChangeRowState();
}

class _MonthChangeRowState extends State<MonthChangeRow> {
  DateTime selectedDate = DateTime.now();

  void _changeMonth(int monthOffset) {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + monthOffset,
        1,
      );
    });
  }

  Future<void> _showDatePicker() async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => _changeMonth(-1),
            icon: const Icon(Icons.arrow_back_ios, size: 20),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _showDatePicker,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      DateFormat(
                        'MMM yyyy',
                        context.locale.languageCode,
                      ).format(selectedDate),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SvgPicture.asset(Assets.svgsCalender, width: 22),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () => _changeMonth(1),
            icon: const Icon(Icons.arrow_forward_ios, size: 20),
          ),
        ],
      ),
    );
  }
}
