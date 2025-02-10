import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  // Observable states for the charts and filter
  var barChartData = <double>[45, 25, 30].obs;
  var lineChartData1 = <double>[20, 30, 40, 60, 70].obs;
  var lineChartData2 = <double>[10, 20, 50, 40, 80].obs;
  var isFilterApplied = false.obs;
  var isLoading = false.obs;

  // Simulated data fetching method
  Future<void> fetchData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
    barChartData.value = [50, 35, 40]; // Mock new data
    lineChartData1.value = [25, 35, 45, 65, 75];
    lineChartData2.value = [15, 25, 55, 45, 85];
    isLoading.value = false;
  }

  // Toggle filter state and adjust data accordingly
  void toggleFilter() {
    isFilterApplied.value = !isFilterApplied.value;
    if (isFilterApplied.value) {
      barChartData.value = [30, 20, 25]; // Mock filtered data
      lineChartData1.value = [20, 25, 35, 45, 55];
      lineChartData2.value = [10, 15, 45, 35, 75];
    } else {
      fetchData();
    }
  }
}
class AnalyticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AnalyticsController());
  }
}