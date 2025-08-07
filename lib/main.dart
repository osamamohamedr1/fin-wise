import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/constants.dart';
import 'package:finance_wise/finance_tracker.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(themeBox);
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      child: const FinanceTracker(),
    ),
  );
}
