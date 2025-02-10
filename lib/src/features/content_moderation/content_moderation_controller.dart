import 'package:get/get.dart';

class ContentModerationController extends GetxController {
  // Filter State
  RxString selectedFilter = "Alphabetical".obs;

  // User List
  final RxList<Map<String, dynamic>> users = [
    {"name": "Zubair Rehmani", "age": 29, "image": "assets/zubair.jpg"},
    {"name": "Arman Malik", "age": 27, "image": "assets/arman.jpg"},
    // Add more user data here
  ].obs;

  // Pagination Logic
  RxInt currentPage = 1.obs;
  RxInt totalPages = 1.obs;

  void setSelectedFilter(String value) {
    selectedFilter.value = value;
    // Apply sorting/filter logic here
  }

  void goToPage(int page) {
    currentPage.value = page;
    // Fetch or paginate user data
  }
}
