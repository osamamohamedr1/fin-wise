import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String formatDate(DateTime date, BuildContext context) {
  final datePart = DateFormat(
    'd MMM, yyyy',
    context.locale.toString(),
  ).format(date); // Apr 30, 2023
  return datePart;
}
