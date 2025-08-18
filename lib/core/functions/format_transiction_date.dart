import 'package:easy_localization/easy_localization.dart';

String formatDate(DateTime date) {
  final datePart = DateFormat('d MMM, yyyy').format(date); // Apr 30, 2023
  return datePart;
}
