import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/shared/widgets/income_expenses_section.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/analysis/presentation/views/widgets/month_change_row.dart';
import 'package:finance_wise/features/analysis/presentation/views/widgets/income_expense_chart.dart';
import 'package:finance_wise/features/analysis/presentation/views/widgets/analysis_summary_cards.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({super.key});

  @override
  State<AnalysisView> createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.fanalysis.tr()),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          verticalSpacing(8),
          const IncomeExpensesSection(),
          verticalSpacing(16),
          Expanded(
            child: WhiteContainer(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      verticalSpacing(20),
                      MonthChangeRow(),
                      verticalSpacing(16),
                      IncomeExpenseChart(),
                      verticalSpacing(20),
                      const AnalysisSummaryCards(),
                      verticalSpacing(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
