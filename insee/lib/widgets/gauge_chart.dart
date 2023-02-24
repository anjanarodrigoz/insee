import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyGaugeChart extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;

  const MyGaugeChart({
    required this.value,
    required this.minValue,
    required this.maxValue,
  });

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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Cycle Time performance'),
                        ),
                        Expanded(
                          child: SfRadialGauge(
                            enableLoadingAnimation: true,
                            animationDuration: 2000,
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: minValue,
                                maximum: maxValue,
                                interval: 2,
                                showLastLabel: true,
                                showLabels: true,
                                showTicks: false,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 0.2,
                                  cornerStyle: CornerStyle.bothCurve,
                                  color: Colors.grey[300],
                                  thicknessUnit: GaugeSizeUnit.factor,
                                  gradient: SweepGradient(
                                    tileMode: TileMode.clamp,
                                    colors: [
                                      Colors.green,
                                      Colors.green.shade400,
                                      Colors.red
                                    ],
                                    stops: const [0.1, 0.6, 0.8],
                                  ),
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: value,
                                    width: 0.1,
                                    enableAnimation: true,
                                    animationDuration: 2000,
                                    cornerStyle: CornerStyle.bothCurve,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    color: Colors.indigo.shade700,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )))));
  }
}
