import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/models/reports_model.dart';

class ReportsController extends GetxController {
  RxList<ReportModel> allReports =
      <ReportModel>[].obs; // Ensure this is not nullable

  @override
  void onReady() {
    super.onReady();
    initAdminStream();
  }

  void initAdminStream() {
    allReports.bindStream(streamAllReports());
  }

  Stream<List<ReportModel>> streamAllReports() {
    try {
      return FirebaseFirestore.instance
          .collection("reports")
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          final data = doc.data();
          print(
              "::::::::::::::: DATA FOR REffhgfhgfgfgfPORTS ${ReportModel.fromJson({
                ...data,
                'id': doc.id
              }).toJson()}");
          return ReportModel.fromJson(
              {...data, 'id': doc.id}); // Ensure doc.id is added
        }).toList();
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error streaming all reports: $e");
      }
      return Stream.value([]); // Return an empty stream on error
    }
  }
}
