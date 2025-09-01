part of 'analysis_cubit.dart';

@immutable
sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}

class AnalysisLoading extends AnalysisState {}

class AnalysisLoaded extends AnalysisState {
  final List<BarChartGroupData> barGroups;
  final double totalIncome;
  final double totalExpense;

  AnalysisLoaded({
    required this.barGroups,
    required this.totalIncome,
    required this.totalExpense,
  });
}

class AnalysisError extends AnalysisState {
  final String message;
  AnalysisError(this.message);
}
