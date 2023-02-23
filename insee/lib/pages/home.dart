import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insee/controllers/operation_controller.dart';
import 'package:insee/widgets/custom_text_form_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final OperationController controller = Get.put(OperationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red.shade500,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SizedBox(
                width: 500.0,
                height: 600.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              labelText: 'year',
                              onChanged: (value) =>
                                  controller.year.value = value,
                              radius: 10.0,
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: CustomTextFormField(
                              labelText: 'month',
                              radius: 10.0,
                              onChanged: (value) =>
                                  controller.month.value = value,
                              keyboardType: TextInputType.datetime,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        labelText: 'Monthly Production',
                        radius: 10.0,
                        onChanged: (value) =>
                            controller.production.value = double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        labelText: 'Actual dozer hours',
                        radius: 10.0,
                        onChanged: (value) =>
                            controller.dozerHours.value = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        labelText: 'Actual drilling hours',
                        radius: 10.0,
                        onChanged: (value) =>
                            controller.drillingHours.value = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        labelText: 'Actual loading hours',
                        radius: 10.0,
                        onChanged: (value) =>
                            controller.loadingHours.value = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        labelText: 'Actual houlingh hours',
                        radius: 10.0,
                        onChanged: (value) =>
                            controller.haulingHours.value = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 40.0),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[600],
                              minimumSize: const Size(300.0, 60.0)),
                          onPressed: () {
                            controller.saveForm();
                            Get.toNamed('/analytics');
                          },
                          child: const Text(
                            'Proceed',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )),
          ),
        )));
  }
}
