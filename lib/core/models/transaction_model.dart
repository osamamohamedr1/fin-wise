import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final double amount;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  final bool isExpense;

  @HiveField(6)
  final String? iconPath;

  @HiveField(7)
  final String? frequency;

  @HiveField(8)
  final String? expensesTitle;

  @HiveField(9)
  final String? note;

  TransactionModel({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.isExpense,
    this.iconPath,
    this.frequency,
    this.expensesTitle,
    this.note,
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
}
