import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransictionsView extends StatelessWidget {
  const TransictionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transictions'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Transictions View',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
