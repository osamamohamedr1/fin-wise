import 'package:easy_localization/easy_localization.dart';

String formatDate(DateTime date) {
  final timePart = DateFormat('HH:mm').format(date); // 18:27
  final datePart = DateFormat('MMMM d').format(date); // April 30
  return '$timePart - $datePart';
}
