import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.analysis.tr()),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Welcome to the Finance Tracker Analysis Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
