import 'package:flutter/material.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircleChart extends StatelessWidget {
  const CircleChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
      ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
      ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
      ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
    ];
    return Container(
        height: 300,
        decoration: BoxDecoration(
            color: AppColours.cardBackground,
            borderRadius: BorderRadius.circular(14.0)),
        child: SfCircularChart(
            title: const ChartTitle(text: "Portfolio Breakdown"),
            series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<ChartData, String>(
                  innerRadius: '70%',
                  explode: true,
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
