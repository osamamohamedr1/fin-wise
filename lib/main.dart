import 'package:finance_wise/core/utils/constants.dart';
import 'package:finance_wise/finance_tracker.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(themeBox);
  runApp(const FinanceTracker());
}
