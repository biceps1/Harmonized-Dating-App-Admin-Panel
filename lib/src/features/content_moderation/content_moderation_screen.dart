import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/controllers/reports_controller.dart';
import 'package:harmonized_admin/src/controllers/user_controller.dart';
import 'package:harmonized_admin/src/core/components/loading%20.dart';
import 'package:harmonized_admin/src/models/user_model.dart';
import 'content_moderation_controller.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';

class ContentModerationDashboard extends StatelessWidget {
  final ContentModerationController controller =
      Get.put(ContentModerationController());
  final ReportsController reportsController = Get.put(ReportsController());
  final UserController userController = Get.put(UserController());

  ContentModerationDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text(
                "Content Moderation Dashboard",
                style: TextStyle(
                  color: Themecolor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.account_circle,
                    color: Themecolor.primaryColor,
                    size: MediaQuery.of(context).size.width > 600 ? 32 : 24,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 600) {
                          // Desktop layout
                          return Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildStatCard("Total Reports",
                                    "${userController.getTotalReportsCount()}"),
                                _buildStatCard("Pending Cases",
                                    "${userController.getPendingCasesCount()}"),
                                _buildStatCard("Resolved Cases",
                                    "${userController.getResolvedCasesCount()}"),
                              ],
                            ),
                          );
                        } else {
                          // Mobile layout
                          return Obx(
                            () => GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                _buildStatCard("Total Reports",
                                    "${userController.getTotalReportsCount()}"),
                                _buildStatCard("Pending Cases",
                                    "${userController.getPendingCasesCount()}"),
                                _buildStatCard("Resolved Cases",
                                    "${userController.getResolvedCasesCount()}"),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: _buildSearchAndFilter(),
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      final filteredUsers = userController.getFilteredUsers();
                      if (MediaQuery.of(context).size.width > 600) {
                        // Desktop layout
                        return Wrap(
                          spacing: 5, // Space between columns
                          runSpacing: 16, // Space between rows
                          children: filteredUsers.isNotEmpty
                              ? filteredUsers
                                  .map((user) => SizedBox(
                                        width: MediaQuery.of(context).size.width /
                                                4 -
                                            10,
                                        child: _buildUserCard(user, context),
                                      ))
                                  .toList()
                              : [
                                  Center(
                                    child: Text("No Users Found"),
                                  )
                                ],
                        );
                      } else {
                        // Mobile layout
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: filteredUsers.isNotEmpty
                                ? filteredUsers
                                    .map((user) => SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2.5,
                                          child: _buildUserCard(user, context),
                                        ))
                                    .toList()
                                : [
                                    Center(
                                      child: Text("No Users Found"),
                                    )
                                  ],
                          ),
                        );
                      }
                    }),
                    _buildPagination(),
                  ],
                ),
              ),
            ),
          ),
          loading() ? LoadingWidget() : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth > 600
            ? MediaQuery.of(context).size.width / 4.5
            : MediaQuery.of(context).size.width / 2.5;
        return SizedBox(
          width: cardWidth,
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
              side: const BorderSide(color: Colors.transparent, width: 1),
            ),
            child: Container(
              height: 170,
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > 600 ? 29 : 24,
                        fontWeight: FontWeight.bold,
                        color: Themecolor.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      count,
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > 600 ? 48 : 36,
                        fontWeight: FontWeight.w400,
                        color: Themecolor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.of(Get.context!).size.height / 20,
          width: MediaQuery.of(Get.context!).size.width / 3,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Themecolor.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          top: 10.0), // Added padding at the top
                      child: Icon(Icons.search, color: Themecolor.primaryColor),
                    ),
                    hintText: "Search",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Row(
            children: [
              const Text('Sort and Filter',
                  style: TextStyle(
                    color: Themecolor.primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              PopupMenuButton<String>(
                onSelected: (value) {
                  userController.setSelectedFilter(value);
                },
                icon: const Icon(Icons.arrow_drop_down, color: Colors.purple),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: "Suspended Users",
                    child: Text("Suspended Users"),
                  ),
                  const PopupMenuItem(
                    value: "Unsuspended Users",
                    child: Text("Unsuspended Users"),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildUserCard(UserModel user, BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(user.images?.first ?? ""),
              radius: 40,
            ),
            const SizedBox(height: 8),
            Text(
              user.name ?? "N/A",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              user.status,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Column(
              children: [
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    if (user.reportStatus == "suspend") {
                      userController.updateUserReportStatus(user.uid!, "yes");
                    } else {
                      showConfirmationDialog("Suspend", context, user: user);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    shadowColor: Colors.grey,
                    elevation: 5,
                  ),
                  child: Text(
                    user.reportStatus == "suspend" ? "Unsuspend" : "Suspend",
                    style: TextStyle(color: Themecolor.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showConfirmationDialog(String title, BuildContext context,
      {required UserModel user}) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("Are you sure you want to $title this user"),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    Get.back();
                    showLoadingDialog(context);
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(user.uid)
                        .update({
                      "status": title == "Approve" ? "Active" : title,
                      "reportStatus":
                          title == "Suspend" ? "suspend" : user.reportStatus
                    }).then((v) => Get.back());
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                      backgroundColor: Themecolor.primaryColor,
                      foregroundColor: Colors.white),
                  child: const Text("Yes"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                      backgroundColor: Themecolor.white,
                      foregroundColor: Colors.black),
                  child: const Text("No"),
                ),
              ],
            ));
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) => const AlertDialog(
                content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Updating Please wait ....."),
                SizedBox(
                  width: 30.0,
                ),
                CircularProgressIndicator(
                  color: Themecolor.primaryColor,
                ),
              ],
            )));
  }

  Widget _buildPagination() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: controller.currentPage.value > 1
                    ? () =>
                        controller.goToPage(controller.currentPage.value - 1)
                    : null,
                child: const Text("Previous")),
            Row(
              children: List.generate(
                controller.totalPages.value,
                (index) => IconButton(
                  onPressed: () => controller.goToPage(index + 1),
                  icon: Icon(
                    Icons.circle,
                    size: 12,
                    color: index + 1 == controller.currentPage.value
                        ? Colors.purple
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: controller.currentPage.value <
                        controller.totalPages.value
                    ? () =>
                        controller.goToPage(controller.currentPage.value + 1)
                    : null,
                child: const Text("Next")),
          ],
        ));
  }
}