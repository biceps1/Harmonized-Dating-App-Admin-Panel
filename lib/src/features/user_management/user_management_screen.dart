import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/components/loading%20.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';
import 'package:harmonized_admin/src/models/user_model.dart';
import 'user_management_controller.dart';

class UserManagementScreen extends StatelessWidget {
  UserManagementScreen({super.key});
  final controller = Get.put(UserManagementController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('User Management',
                style: TextStyle(color: Themecolor.primaryColor)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Themecolor.primaryColor),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Text('Admin',
                      style: TextStyle(
                          color: Themecolor.primaryColor,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User Management',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Themecolor.primaryColor),
                ),
                const SizedBox(height: 16),

                // Data Table to Show All Users
                Expanded(
                  child: Obx(() {
                    if (controller.allUsers.isEmpty) {
                      return const Center(
                        child: Text(
                          "No users available",
                          style: TextStyle(color: Themecolor.primaryColor),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columnSpacing: MediaQuery.of(context).size.width * 0.08,
                        dataRowHeight: 70.0,
                        columns: const [
                          DataColumn(
                              label: Text(
                            'Name',
                            style: TextStyle(
                                color: Themecolor.primaryColor,
                                fontFamily: "Bree Serif"),
                          )),
                          DataColumn(
                              label: Text(
                            'Email',
                            style: TextStyle(
                                color: Themecolor.primaryColor,
                                fontFamily: "Bree Serif"),
                          )),
                          DataColumn(
                              label: Text(
                            'Gender',
                            style: TextStyle(
                                color: Themecolor.primaryColor,
                                fontFamily: "Bree Serif"),
                          )),
                          DataColumn(
                              label: Text(
                            'Profile Picture',
                            style: TextStyle(
                                color: Themecolor.primaryColor,
                                fontFamily: "Bree Serif"),
                          )),
                          DataColumn(
                              label: Text(
                            'Status',
                            style: TextStyle(
                                color: Themecolor.primaryColor,
                                fontFamily: "Bree Serif"),
                          )),
                        ],
                        rows: controller.paginatedUsers.map((user) {
                          return DataRow(cells: [
                            DataCell(Text(
                              user.name ?? "N/A",
                              style: const TextStyle(
                                  color: Themecolor.primaryColor,
                                  fontFamily: "Bree Serif"),
                            )),
                            DataCell(Text(
                              user.email ?? "N/A",
                              style: const TextStyle(
                                  color: Themecolor.primaryColor,
                                  fontFamily: "Bree Serif"),
                            )),
                            DataCell(Text(
                              user.gender == "male" ? "Male" : "Female",
                              style: const TextStyle(
                                  color: Themecolor.primaryColor,
                                  fontFamily: "Bree Serif"),
                            )),
                            DataCell(
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  user.images?.isNotEmpty == true
                                      ? user.images!.first
                                      : 'https://via.placeholder.com/40',
                                ),
                              ),
                            ),
                            DataCell(Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: user.status == "Active"
                                      ? Colors.green
                                      : Colors.red,
                                  radius: 5,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  user.status,
                                  style: TextStyle(
                                      color: user.status == "Active"
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ],
                            )),
                          ]);
                        }).toList(),
                      ),
                    );
                  }),
                ),

                // Pagination Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => TextButton(
                        onPressed: controller.currentPage.value > 0
                            ? () => controller
                                .changePage(controller.currentPage.value - 1)
                            : null,
                        child: Text(
                          "Previous",
                          style: TextStyle(
                            color: controller.currentPage.value > 0
                                ? Themecolor.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        'Page ${controller.currentPage.value + 1} of ${controller.totalPages}',
                        style: const TextStyle(color: Themecolor.primaryColor),
                      ),
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: controller.currentPage.value <
                                controller.totalPages - 1
                            ? () => controller
                                .changePage(controller.currentPage.value + 1)
                            : null,
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: controller.currentPage.value <
                                    controller.totalPages - 1
                                ? Themecolor.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        loading() ? LoadingWidget() : const SizedBox(),
      ],
    );
  }
}
