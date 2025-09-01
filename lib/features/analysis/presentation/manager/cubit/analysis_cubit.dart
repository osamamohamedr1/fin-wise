import 'package:bloc/bloc.dart';
import 'package:finance_wise/features/analysis/data/repos/analysis_repo.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit() : super(AnalysisInitial());

  final AnalysisRepo analysisRepo = AnalysisRepo();

  Future<void> loadDailyChart(DateTime month) async {
    emit(AnalysisLoading());

    try {
      final barGroups = await analysisRepo.getDailyBarGroups(month);
      final monthlyTotals = await analysisRepo.getCurrentMonthTotals(month);

      emit(
        AnalysisLoaded(
          barGroups: barGroups,
          totalIncome: monthlyTotals["income"] ?? 0.0,
          totalExpense: monthlyTotals["expense"] ?? 0.0,
        ),
      );
    } catch (e) {
      emit(AnalysisError(e.toString()));
    }
  }
}
