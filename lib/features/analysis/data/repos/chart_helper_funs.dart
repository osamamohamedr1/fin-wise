import 'package:fl_chart/fl_chart.dart';

class ChartHelperFuns {
  static double calculateMaxValue(List<BarChartGroupData> barGroups) {
    if (barGroups.isEmpty) return 2000;

    double maxValue = 0;
    for (final group in barGroups) {
      for (final rod in group.barRods) {
        if (rod.toY > maxValue) {
          maxValue = rod.toY;
        }
      }
    }
    return maxValue == 0 ? 2000 : maxValue;
  }

  static double getResponsiveMaxY(double actualMaxValue) {
    if (actualMaxValue <= 1000) {
      return 2000;
    } else if (actualMaxValue <= 2000) {
      return 4000;
    } else if (actualMaxValue <= 4000) {
      return 6000;
    } else if (actualMaxValue <= 6000) {
      return 8000;
    } else if (actualMaxValue <= 8000) {
      return 10000;
    } else {
      final roundedMax = ((actualMaxValue / 2000).ceil() * 2000).toDouble();
      return roundedMax + 2000;
    }
  }

  static double getResponsiveInterval(double maxY) {
    if (maxY <= 2000) {
      return 500;
    } else if (maxY <= 4000) {
      return 1000;
    } else if (maxY <= 8000) {
      return 2000;
    } else if (maxY <= 20000) {
      return 4000;
    } else {
      return maxY / 5;
    }
  }
}
