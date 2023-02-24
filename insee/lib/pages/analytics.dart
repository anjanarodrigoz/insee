import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:insee/widgets/pie_chart.dart';
import 'package:insee/widgets/setting_card.dart';

import '../controllers/operation_controller.dart';
import '../widgets/bar_chart_card.dart';
import '../widgets/gauge_chart.dart';

class Analytics extends StatelessWidget {
  Analytics({super.key});
  final OperationController controller = Get.put(OperationController());

  @override
  Widget build(BuildContext context) {
    controller.loadForm();
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [upperColumn(), bottomColumn()]),
      ),
    );
  }

  upperColumn() {
    return Expanded(
        flex: 8,
        child: Row(children: [
          //Should cost pie chart
          MyPieChart(data: [
            PieData('A', 10),
            PieData('D', 10),
            PieData('a', 80),
            PieData('C', 30),
            PieData('b', 50)
          ]),

          //Performence Charts
          performanceCard(),
        ]));
  }

  performanceCard() {
    return Expanded(
        flex: 3,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  MyBarChart(
                    title: 'Loading performance',
                    data: const [BarData(20, 10)],
                  ),
                  MyBarChart(
                    title: 'Hauling performance',
                    data: const [BarData(20, 10)],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  MyBarChart(
                    title: 'Drilling performance',
                    data: const [BarData(20, 10)],
                  ),
                  const MyGaugeChart(
                    maxValue: 35,
                    minValue: 15,
                    value: 25,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  cycleTimeCard() {
    return const Card();
  }

  bottomColumn() {
    return Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SettingCard(
              src: 'time.png',
            ),
            SettingCard(
              src: 'operater.png',
            ),
            SettingCard(
              src: 'work.png',
            ),
            SettingCard(
              src: 'filling.png',
            ),
            SettingCard(
              src: 'excavater.png',
            ),
            SettingCard(
              src: 'dumptruck.png',
            ),
            SettingCard(
              src: 'chemical.png',
            ),
            SettingCard(
              src: 'setting.png',
            ),
          ],
        ));
  }
}
