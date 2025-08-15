import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';

abstract class TransactionRepository {
  Future<List<TransactionModel>> getTransactionsByCategory(String category);
  Future<List<TransactionModel>> getAllTransactions();
  Future<Map<String, List<TransactionModel>>> getTransactionsGroupedByMonth();
}

class TransactionRepositoryImpl implements TransactionRepository {
  // In a real app, this would connect to a database or API
  @override
  Future<List<TransactionModel>> getTransactionsByCategory(
    String category,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    final allTransactions = await getAllTransactions();
    return allTransactions
        .where(
          (transaction) =>
              transaction.category.toLowerCase() == category.toLowerCase(),
        )
        .toList();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    return _getSampleTransactions();
  }

  @override
  Future<Map<String, List<TransactionModel>>>
  getTransactionsGroupedByMonth() async {
    final transactions = await getAllTransactions();
    final Map<String, List<TransactionModel>> grouped = {};

    for (final transaction in transactions) {
      final monthYear = DateFormat('MMMM yyyy').format(transaction.date);
      if (!grouped.containsKey(monthYear)) {
        grouped[monthYear] = [];
      }
      grouped[monthYear]!.add(transaction);
    }

    // Sort transactions within each month by date (most recent first)
    grouped.forEach((key, value) {
      value.sort((a, b) => b.date.compareTo(a.date));
    });

    return grouped;
  }

  List<TransactionModel> _getSampleTransactions() {
    return [
      TransactionModel(
        id: '1',
        title: LocaleKeys.salary.tr(),
        category: LocaleKeys.income.tr(),
        amount: 5000,
        date: DateTime.now().subtract(const Duration(days: 1)),
        isExpense: false,
        iconPath: Assets.svgsSalary,
        frequency: LocaleKeys.monthly.tr(),
      ),
      TransactionModel(
        id: '2',
        title: LocaleKeys.groceries.tr(),
        category: LocaleKeys.food.tr(),
        amount: 150,
        date: DateTime.now().subtract(const Duration(days: 2)),
        isExpense: true,
        iconPath: Assets.svgsGroceries,
        frequency: LocaleKeys.weekly.tr(),
      ),
      TransactionModel(
        id: '3',
        title: LocaleKeys.fuel.tr(),
        category: LocaleKeys.transport.tr(),
        amount: 80,
        date: DateTime.now().subtract(const Duration(days: 2)),
        isExpense: true,
        iconPath: Assets.svgsTransport,
        frequency: LocaleKeys.weekly.tr(),
      ),
      TransactionModel(
        id: '4',
        title: LocaleKeys.dinner.tr(),
        category: LocaleKeys.food.tr(),
        amount: 45,
        date: DateTime.now().subtract(const Duration(days: 3)),
        isExpense: true,
        iconPath: Assets.svgsFood,
        frequency: LocaleKeys.daily.tr(),
      ),
      TransactionModel(
        id: '5',
        title: LocaleKeys.rent.tr(),
        category: LocaleKeys.rent.tr(),
        amount: 1200,
        date: DateTime.now().subtract(const Duration(days: 5)),
        isExpense: true,
        iconPath: Assets.svgsRent,
        frequency: LocaleKeys.monthly.tr(),
      ),
      // Add more sample transactions for different months
      TransactionModel(
        id: '6',
        title: LocaleKeys.dinner.tr(),
        category: LocaleKeys.food.tr(),
        amount: 27.20,
        date: DateTime(2024, 3, 31, 20, 55),
        isExpense: true,
        iconPath: Assets.svgsFood,
        frequency: LocaleKeys.daily.tr(),
      ),
      TransactionModel(
        id: '7',
        title: 'Delivery Pizza',
        category: LocaleKeys.food.tr(),
        amount: 18.35,
        date: DateTime(2024, 4, 24, 18, 9),
        isExpense: true,
        iconPath: Assets.svgsFood,
        frequency: LocaleKeys.daily.tr(),
      ),
      TransactionModel(
        id: '8',
        title: 'Lunch',
        category: LocaleKeys.food.tr(),
        amount: 15.40,
        date: DateTime(2024, 4, 15, 13, 30),
        isExpense: true,
        iconPath: Assets.svgsFood,
        frequency: LocaleKeys.daily.tr(),
      ),
      TransactionModel(
        id: '9',
        title: 'Brunch',
        category: LocaleKeys.food.tr(),
        amount: 12.13,
        date: DateTime(2024, 4, 8, 9, 30),
        isExpense: true,
        iconPath: Assets.svgsFood,
        frequency: LocaleKeys.daily.tr(),
      ),
    ];
  }
}
