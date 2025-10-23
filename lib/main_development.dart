import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/constants.dart';
import 'package:finance_wise/finance_tracker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await Hive.initFlutter();

  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>(transactionsBox);
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
