import 'package:get/get.dart';
import 'package:insee/controllers/operation_controller.dart';

class SimulatorController extends GetxController {
  //Loading cycle time (min)
  final lTime = 4.0.obs;

  //Hauling cycle time (min)
  final hTime = 18.0.obs;

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
  final acDrillingRate = 0.0.obs;

  //Calculated drilling hours
  final calDrillHours = 0.0.obs;

  //Calculated Hauling hours
  final calHaulHours = 0.0.obs;

  //Calculated Loading hours
  final calLoadHours = 0.0.obs;

  //Calculated Dozer hours
  final calDozerHours = 0.0.obs;

  //Calculated cycle time
  final calCycleTime = 0.0.obs;

  //Total Drilling Cost
  final totalDrillingCost = 0.0.obs;

  //Total Blasting Cost
  final totalBlastingCost = 0.0.obs;

  //Total Loading Cost
  final totalLoadingCost = 0.0.obs;

  //Total Hauling Cost
  final totalHaulingCost = 0.0.obs;

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
    acDrillingRate.value = controller.drillingRate.value;

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
            density.value *
            3);

    calHaulHours.value =
        acProduction.value * hTime.value / (truckCapacity.value * 60);

    calDrillHours.value =
        dhLength.value * hpPerDay.value * 30 / acDrillingRate.value / 3.5;

    calCycleTime.value =
        truckCapacity.value * 60 * calHaulHours.value / acProduction.value;
  }

  void calculatedShouldCost() {
    // Disel Consumption for Drilling Machine
    double diselConForD = 14080;

    //Current disel Rate in Srilanaka
    double diselRate = 500.0;

    //Drill Machine Hours
    double dmHours = 240;

    //Cost For Gets Parts
    double partsCost = 200000;

    //Operater Salary For Drilling Machine
    double operaterSalary = 300000;

    //Drilling Machine Rate
    double dmRate = 2960;

    //Calulate Total driling Machine
    double diselForDM = diselConForD * diselRate;
    double manitanceCostForDM = dmHours * dmRate + partsCost;
    totalDrillingCost.value = diselForDM + manitanceCostForDM + operaterSalary;

    //Disel For Blasting
    double diselConForB = 838.98;
    double toatalEC = 8005118;
    double paymentFHFB = 125000;

    //Total cost For Blasting
    double diselForB = diselConForB * diselRate;
    totalBlastingCost.value = diselForB + toatalEC + paymentFHFB;

    //Total cost For Excavator
    double diselConForE = 14080;

    //Loading Machine hours
    double loadingMH = 240;

    //Loading rate
    double loadingRate = 18;

    //Usd rate
    double usdRate = 360;

    //Excavator Operater Salary
    double excavatorOperaterSalary = 300000;

    //Total Cost For Loading
    double diselForExcavator = diselConForE * diselRate;
    double maintanceCostForExcavator = loadingMH * loadingRate * usdRate;
    totalLoadingCost.value =
        diselForExcavator + maintanceCostForExcavator + excavatorOperaterSalary;

    //Disel Consumption For Dump Truck
    double diselConForDT = 33076;

    //Dump Truck Machine Hours
    double dumpTruckMH = 720;

    //dump truck rate
    double dtRate = 20;

    //Dump Truck Operator Salary
    double dtOperaterSalary = 300000;

    //Total Cost For Hauling
    double diselForDT = diselConForDT * diselRate;
    double maintanceCostForDT = dumpTruckMH * dtRate * usdRate;
    totalHaulingCost.value = diselForDT + maintanceCostForDT + dtOperaterSalary;
  }
}
