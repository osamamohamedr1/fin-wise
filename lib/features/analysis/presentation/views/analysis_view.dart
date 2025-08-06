import 'package:flutter/material.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analysis')),
      body: Center(
        child: Text(
          'Welcome to the Finance Tracker Analysis Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
