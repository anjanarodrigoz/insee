import 'package:get/get.dart';
import 'package:insee/controllers/operation_controller.dart';

class SimulatorController extends GetxController {
  //Loading cycle time (min)
  final lTime = 18.0.obs;

  //Hauling cycle time (min)
  final hTime = 4.0.obs;

  //Fill factor(%)
  final fillFac = 0.9.obs;

  //Swell Factor(%)
  final swellFac = 0.8.obs;

  //Job operater effiecency(%)
  final joEffiecency = 0.95.obs;

  //Mechanical availability(%)
  final mechAvailability = 0.95.obs;

  //Production Volume per hour
  final pvPerHour = 4.5.obs;

  //Bucket capacity of the Loader
  final bcLoader = 4.6.obs;

  //Truck capacity
  final truckCapacity = 55.0.obs;

  //density
  final density = 2400.0.obs;

  //drill hole lengeth(mm)
  final dhLength = 10.0.obs;

  //Number of holes per day
  final hpPerDay = 60.0.obs;

  //Drilling rate
  final drillRate = 36.6.obs;

  //Year
  final year = 0.obs;

  //Month
  final month = 0.obs;

  //Actual Production
  final acProduction = 0.0.obs;

  //Actual drilling hours
  final acDrillHours = 0.0.obs;

  //Actual Hauling hours
  final acHaulHours = 0.0.obs;

  //Actual Loading hours
  final acLoadHours = 0.0.obs;

  //Actual Dozer hours
  final acDozerHours = 0.0.obs;

  //Calculated drilling hours
  final calDrillHours = 0.0.obs;

  //Calculated Hauling hours
  final calHaulHours = 0.0.obs;

  //Calculated Loading hours
  final calLoadHours = 0.0.obs;

  //Calculated Dozer hours
  final calDozerHours = 0.0.obs;

  //Calculated cycle time;
  final calCycleTime = 0.0.obs;

  @override
  void onInit() {
    final OperationController controller = Get.put(OperationController());
    controller.loadForm();

    year.value = controller.year.value;
    month.value = controller.month.value;
    acProduction.value = controller.production.value;
    acDrillHours.value = controller.drillingHours.value;
    acHaulHours.value = controller.haulingHours.value;
    acLoadHours.value = controller.loadingHours.value;
    acDozerHours.value = controller.loadingHours.value;

    findCalculatedValue();

    super.onInit();
  }

  void findCalculatedValue() async {
    calLoadHours.value = swellFac.value *
        lTime.value *
        acProduction.value *
        1000 /
        (bcLoader.value *
            60 *
            fillFac.value *
            joEffiecency.value *
            mechAvailability.value *
            density.value);

    calHaulHours.value =
        acProduction.value * 60 / (truckCapacity.value * hTime.value);

    calDrillHours.value =
        dhLength.value * hpPerDay.value * 30 / drillRate.value;

    calCycleTime.value =
        acProduction.value * 60 / (truckCapacity.value * acHaulHours.value);

    print('Cycle TIme : ${calCycleTime.value}');
    print('Drill hours : ${calDrillHours.value}');
    print('Haul Hours : ${calHaulHours.value}');
    print('Loading TIme : ${calLoadHours.value}');
  }
}
