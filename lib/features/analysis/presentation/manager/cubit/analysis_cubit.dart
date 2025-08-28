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
      emit(AnalysisLoaded(barGroups));
    } catch (e) {
      emit(AnalysisError(e.toString()));
    }
  }
}
