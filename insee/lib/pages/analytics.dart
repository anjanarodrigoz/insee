import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/operation_controller.dart';

class Analytics extends StatelessWidget {
  Analytics({super.key});
  final OperationController controller = Get.put(OperationController());
  @override
  Widget build(BuildContext context) {
    controller.loadForm();
    return const Scaffold();
  }
}
