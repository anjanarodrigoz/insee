import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyBarChart extends StatelessWidget {
  final List<BarData> data;
  final String title;
  TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

  MyBarChart({required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 10.0,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 50.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(title),
                        ),
                        Expanded(
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                              title: AxisTitle(text: 'Hours'),
                            ),
                            tooltipBehavior: tooltipBehavior,
                            series: <ChartSeries>[
                              ColumnSeries<BarData, String>(
                                enableTooltip: true,
                                color: Colors.blue.shade900,
                                dataSource: data,
                                xValueMapper: (BarData d, _) => 'Actual',
                                yValueMapper: (BarData d, _) => d.actual,
                              ),
                              ColumnSeries<BarData, String>(
                                enableTooltip: true,
                                color: Colors.green.shade600,
                                dataSource: data,
                                xValueMapper: (BarData d, _) => 'Calculated',
                                yValueMapper: (BarData d, _) => d.calculated,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )))));
  }
}

class BarData {
  final double actual;
  final double calculated;

  const BarData(this.actual, this.calculated);
}
