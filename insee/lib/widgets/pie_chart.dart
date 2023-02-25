import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyPieChart extends StatelessWidget {
  final List<PieData> data;
  TooltipBehavior toolTipBehavior = TooltipBehavior(enable: true);
  MyPieChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SfCircularChart(
              title: ChartTitle(
                  text: 'Should Cost Value',
                  alignment: ChartAlignment.center,
                  textStyle: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold)),
              legend: Legend(
                  isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: toolTipBehavior,
              series: <CircularSeries>[
                PieSeries<PieData, String>(
                  enableTooltip: true,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  dataSource: data,
                  xValueMapper: (PieData d, _) => d.category,
                  yValueMapper: (PieData d, _) => d.value,
                ),
              ],
            )));
  }
}

class PieData {
  final String category;
  final double value;

  PieData(this.category, this.value);
}
