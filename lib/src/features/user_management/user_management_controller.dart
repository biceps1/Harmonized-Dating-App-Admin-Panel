// ignore_for_file: unused_local_variable

import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/controllers/user_controller.dart';
import 'package:harmonized_admin/src/models/user_model.dart';

class UserManagementController extends GetxController {
  final UserController userController = Get.find<UserController>();
  final RxInt currentPage = 0.obs;
  final int rowsPerPage = 5;
  RxList<UserModel> allUsers = <UserModel>[].obs;

  List<UserModel> get paginatedUsers {
    final start = currentPage.value * rowsPerPage;
    final end = start + rowsPerPage;
    return allUsers.sublist(
      start,
      end > allUsers.length ? allUsers.length : end,
    );
  }

  @override
  void onInit() {
    fetchAllUsers();
    super.onInit();
  }

  Future<void> fetchAllUsers() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').get();
      allUsers.value = snapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      Get.snackbar('Success', 'Users loaded successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch users: $e');
    }
  }

  int get totalPages {
    return (allUsers.length / rowsPerPage).ceil();
  }

  void changePage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < totalPages) {
      currentPage.value = pageIndex;
    }
  }
}
