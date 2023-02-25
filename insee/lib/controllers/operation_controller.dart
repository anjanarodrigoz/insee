import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OperationController extends GetxController {
  final month = RxInt(0);
  final year = RxInt(0);
  final production = RxDouble(0);
  final dozerHours = RxDouble(0);
  final drillingHours = RxDouble(0);
  final loadingHours = RxDouble(0);
  final haulingHours = RxDouble(0);

  final box = GetStorage();

  void saveForm() {
    box.write('month', month.value);
    box.write('year', year.value);
    box.write('production', production.value);
    box.write('dozerHours', dozerHours.value);
    box.write('drillingHours', drillingHours.value);
    box.write('loadingHours', loadingHours.value);
    box.write('haulingHours', haulingHours.value);
  }

  void loadForm() {
    month.value = box.read('month') ?? 0;
    year.value = box.read('year') ?? 0;
    production.value = box.read('production') ?? 0;
    dozerHours.value = box.read('dozerHours') ?? 0;
    drillingHours.value = box.read('drillingHours') ?? 0;
    loadingHours.value = box.read('loadingHours') ?? 0;
    haulingHours.value = box.read('haulingHours') ?? 0;
  }
}
