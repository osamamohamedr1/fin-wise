part of 'analysis_cubit.dart';

@immutable
sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}

class AnalysisLoading extends AnalysisState {}

class AnalysisLoaded extends AnalysisState {
  final List<BarChartGroupData> barGroups;
  AnalysisLoaded(this.barGroups);
}

class AnalysisError extends AnalysisState {
  final String message;
  AnalysisError(this.message);
}
