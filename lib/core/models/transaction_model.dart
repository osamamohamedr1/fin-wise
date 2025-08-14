import 'package:flutter/material.dart';

class TransactionModel {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final bool isExpense;
  final String? iconPath;
  final Color? color;
  final String? frequency;

  TransactionModel({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.isExpense,
    this.iconPath,
    this.color,
    this.frequency,
  });

  // Helper method to format amount with proper sign
  String get formattedAmount {
    final sign = isExpense ? '-' : '+';
    return '$sign\$${amount.toStringAsFixed(0)}';
  }

  // Helper method to get formatted date
  String get formattedDate {
    return '${date.day}/${date.month}/${date.year}';
  }

  // // Helper method to get frequency display
  // String get displayFrequency {
  //   if (frequency != null) return frequency!;

  //   // Auto-determine frequency based on category/title
  //   switch (category.toLowerCase()) {
  //     case 'salary':
  //     case 'rent':
  //     case 'housing':
  //       return 'Monthly';
  //     case 'groceries':
  //     case 'fuel':
  //       return 'Weekly';
  //     case 'food':
  //     case 'dinner':
  //     case 'entertainment':
  //       return 'Daily';
  //     default:
  //       return 'One-time';
  //   }
  // }
}
