import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/constants.dart';
import 'package:finance_wise/finance_tracker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SentryWidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();

  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>(transactionsBox);
  await Hive.openBox(themeBox);
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://4295f0010351ce8085879cd1d0e6b273@o4510239235112960.ingest.us.sentry.io/4510239244943360';

      options.sendDefaultPii = true;
      // Set sample rate to 1.0 to capture 100% of transactions for performance monitoring
      options.tracesSampleRate = 1.0;
      // Enable debug mode to see what's happening (remove in production)
      options.debug = true;
      // Capture failed HTTP requests
      options.captureFailedRequests = true;
      log('Sentry Initialized');
    },
    appRunner: () {
      FlutterError.onError = (FlutterErrorDetails details) async {
        await Sentry.captureException(
          details.exception,
          stackTrace: details.stack,
        );
        log('Flutter Error: ${details.exception}');
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        Sentry.captureException(error, stackTrace: stack);
        log('Async Error: $error');
        return true;
      };

      runApp(
        EasyLocalization(
          path: 'assets/translations',
          supportedLocales: [Locale('en'), Locale('ar')],
          fallbackLocale: const Locale('en'),
          child: const FinanceTracker(),
        ),
      );
    },
  );
}
