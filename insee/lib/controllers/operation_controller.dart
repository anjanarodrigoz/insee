import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OperationController extends GetxController {
  final month = RxString('');
  final year = RxString('');
  final production = RxDouble(0);
  final dozerHours = RxInt(0);
  final drillingHours = RxInt(0);
  final loadingHours = RxInt(0);
  final haulingHours = RxInt(0);

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
    month.value = box.read('month') ?? '';
    year.value = box.read('year') ?? '';
    production.value = box.read('production') ?? 0;
    dozerHours.value = box.read('dozerHours') ?? 0;
    drillingHours.value = box.read('drillingHours') ?? 0;
    loadingHours.value = box.read('loadingHours') ?? 0;
    haulingHours.value = box.read('haulingHours') ?? 0;
  }
}
