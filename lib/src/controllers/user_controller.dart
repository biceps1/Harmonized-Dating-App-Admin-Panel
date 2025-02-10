// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/services/user_services.dart';
import 'package:harmonized_admin/src/models/user_model.dart';

final userCntr = Get.find<UserController>();

class UserController extends GetxController {
  Rx<UserModel>? user = UserModel().obs;
  RxList<UserModel>? allUsers = <UserModel>[].obs;
  RxString selectedFilter = ''.obs;

  @override
  void onReady() {
    super.onReady();
    initAdminStream();
    getBlockedUsers(); // Fetch blocked users
  }

  void initAdminStream() async {
    allUsers!.bindStream(UserServices().streamAllUsers());

    ever(user!, (UserModel? user) {
      if (user != null) {
        print('User data: ${user.toString()}');
        print('User details: ${user.otherDetails}');
      }
    });

    ever(allUsers!, (List<UserModel>? users) {
      print('All users data: ${users.toString()}');
    });
  }

  RxList<String>? blockedUserIds = <String>[].obs;

  void getBlockedUsers() {
    blockedUserIds!
        .bindStream(UserServices().streamBlockedUsers(user?.value.uid ?? '1'));
  }

  void setSelectedFilter(String filter) {
    selectedFilter.value = filter;
  }

  List<UserModel> getFilteredUsers() {
    if (selectedFilter.value == "Suspended Users") {
      return allUsers!.where((user) => user.reportStatus == "suspend").toList();
    } else if (selectedFilter.value == "Unsuspended Users") {
      return allUsers!.where((user) => user.reportStatus == "yes").toList();
    } else {
      return allUsers!.where((user) => user.reportStatus == "yes").toList();
    }
  }

  int getTotalReportsCount() {
    return allUsers!.where((user) => user.reportStatus?.isNotEmpty ?? false).length;
  }

  int getPendingCasesCount() {
    return allUsers!.where((user) => user.reportStatus == "yes").length;
  }

  int getResolvedCasesCount() {
    return allUsers!.where((user) => user.reportStatus == "suspend").length;
  }

  Future<void> updateUserReportStatus(String userId, String status) async {
    await FirebaseFirestore.instance.collection("users").doc(userId).update({
      "reportStatus": status,
    });
  }
}