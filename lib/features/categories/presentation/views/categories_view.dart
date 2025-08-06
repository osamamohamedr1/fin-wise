import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Center(
        child: Text(
          'Welcome to the Finance Tracker Categories Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
