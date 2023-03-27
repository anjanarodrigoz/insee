import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insee/controllers/simulater_controller.dart';
import 'package:insee/widgets/setting_card.dart';
import '../widgets/bar_chart_card.dart';
import '../widgets/gauge_chart.dart';
import '../widgets/pie_chart.dart';
import '../widgets/slider_dialog.dart';

class Analytics extends StatelessWidget {
  Analytics({super.key});
  final SimulatorController controller = Get.put(SimulatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [upperColumn(), bottomColumn()]),
      ),
    );
  }

  upperColumn() {
    controller.calculatedShouldCost();
    return Expanded(
        flex: 8,
        child: Row(children: [
          //Should cost pie chart
          Expanded(
            flex: 2,
            child: MyPieChart(data: [
              PieData('Drilling Cost', controller.totalDrillingCost.value),
              PieData('Blasting Cost', controller.totalBlastingCost.value),
              PieData('Loading Cost', controller.totalLoadingCost.value),
              PieData('Hauling Cost', controller.totalHaulingCost.value),
            ]),
          ),

          //Performence Charts
          Expanded(
            flex: 3,
            child: performanceCard(),
          )
        ]));
  }

  performanceCard() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Obx(() => MyBarChart(
                    title: 'Loading performance',
                    data: [
                      BarData(controller.acLoadHours.value,
                          controller.calLoadHours.value)
                    ],
                  )),
              Obx(() => MyBarChart(
                    title: 'Hauling performance',
                    data: [
                      BarData(controller.acHaulHours.value,
                          controller.calHaulHours.value)
                    ],
                  )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Obx(() => MyBarChart(
                    title: 'Drilling performance',
                    data: [
                      BarData(controller.acDrillHours.value,
                          controller.calDrillHours.value)
                    ],
                  )),
              Obx(() => MyGaugeChart(
                    maxValue: 30,
                    minValue: 10,
                    value: controller.calCycleTime.value,
                  ))
            ],
          ),
        ),
      ],
    );
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
              onTap: () async {
                controller.hTime.value = await Get.dialog(SliderDialog(
                  title: 'Hauling Cycle Time',
                  interval: 1,
                  maxValue: 20,
                  minValue: 10,
                  value: controller.hTime.value,
                ));
                controller.findCalculatedValue();
              },
            ),
            SettingCard(
              src: 'operater.png',
              onTap: () async {
                controller.joEffiecency.value = await Get.dialog(SliderDialog(
                  title: 'Precentage of Job Operater Effiecency',
                  interval: 0.1,
                  maxValue: 1,
                  minValue: 0.1,
                  value: controller.joEffiecency.value,
                ));
                controller.findCalculatedValue();
              },
            ),
            SettingCard(
              src: 'work.png',
              onTap: () async {
                controller.swellFac.value = await Get.dialog(SliderDialog(
                  title: 'Swell Factor',
                  interval: 0.1,
                  maxValue: 1,
                  minValue: 0.1,
                  value: controller.swellFac.value,
                ));
                controller.findCalculatedValue();
              },
            ),
            SettingCard(
              src: 'filling.png',
              onTap: () async {
                controller.fillFac.value = await Get.dialog(SliderDialog(
                  title: 'Fill Factor',
                  interval: 0.1,
                  maxValue: 1,
                  minValue: 0.1,
                  value: controller.fillFac.value,
                ));
                controller.findCalculatedValue();
              },
            ),
            SettingCard(
              src: 'excavater.png',
              onTap: () async {
                controller.bcLoader.value = await Get.dialog(SliderDialog(
                  title: 'Bucket Capacity of the Loader',
                  interval: 0.1,
                  maxValue: 6,
                  minValue: 4,
                  value: controller.bcLoader.value,
                ));
                controller.findCalculatedValue();
              },
            ),
            SettingCard(
              src: 'dumptruck.png',
              onTap: () async {
                controller.truckCapacity.value = await Get.dialog(SliderDialog(
                  title: 'Truck Capacity',
                  interval: 5,
                  maxValue: 70,
                  minValue: 40,
                  value: controller.truckCapacity.value,
                ));
                controller.findCalculatedValue();
              },
            ),
            SettingCard(
              src: 'chemical.png',
              onTap: () async {
                controller.density.value = await Get.dialog(SliderDialog(
                  title: 'Density',
                  interval: 100,
                  maxValue: 3000,
                  minValue: 2000,
                  value: controller.density.value,
                ));
                controller.findCalculatedValue();
              },
            ),
            SettingCard(
              src: 'setting.png',
              onTap: () async {
                controller.drillRate.value = await Get.dialog(SliderDialog(
                  title: 'Drilling Rate',
                  interval: 2.5,
                  maxValue: 40,
                  minValue: 20,
                  value: controller.drillRate.value,
                ));
                controller.findCalculatedValue();
              },
            ),
          ],
        ));
  }
}
