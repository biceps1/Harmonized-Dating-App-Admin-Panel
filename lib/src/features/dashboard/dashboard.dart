import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/controllers/user_controller.dart';
import 'package:harmonized_admin/src/core/components/loading%20.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';

class DashboardScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  Map<int, String> getDatesForCurrentMonth() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);

    // Create a mapping of day indices to dates
    return {
      for (int i = 0; i < now.day; i++)
        i: "${startOfMonth.add(Duration(days: i)).day}-${startOfMonth.month}-${startOfMonth.year}"
    };
  }

  List<FlSpot> getUserCountForCurrentMonth() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);

    // Filter users created this month
    final currentMonthUsers = userController.allUsers
        ?.where((user) =>
            user.createdAt != null && user.createdAt!.isAfter(startOfMonth))
        .toList();

    // Map users to daily counts
    final dailyCounts = List<int>.filled(now.day, 0);

    for (var user in currentMonthUsers ?? []) {
      final day = user.createdAt!.day - 1; // Convert day to 0-indexed
      dailyCounts[day]++;
    }

    // Convert daily counts to FlSpot for graph
    return List<FlSpot>.generate(
      dailyCounts.length,
      (index) => FlSpot(index.toDouble(), dailyCounts[index].toDouble()),
    );
  }

  DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final datesMap = getDatesForCurrentMonth();
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Themecolor.white,
              actions: [
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Center(child: Text('Admin')),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Themecolor.primaryColor,
                        fontFamily: "Bree Serif"),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(1, 0),
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                        color: Colors.black38)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'User Analytics',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Themecolor.primaryColor,
                                        fontFamily: "Bree Serif"),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(38.0),
                                      child: LineChart(
                                        duration: const Duration(seconds: 1),
                                        LineChartData(
                                          borderData: FlBorderData(
                                            border: const Border.symmetric(
                                              horizontal: BorderSide(
                                                color: Colors.black26,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots:
                                                  getUserCountForCurrentMonth(),
                                              isCurved: true,
                                              color: Themecolor.primaryColor,
                                              barWidth: 2,
                                              isStrokeCapRound: true,
                                              dotData:
                                                  const FlDotData(show: true),
                                              belowBarData:
                                                  BarAreaData(show: false),
                                            ),
                                          ],
                                          gridData: FlGridData(
                                            getDrawingHorizontalLine: (value) =>
                                                const FlLine(
                                              color: Colors.black26,
                                            ),
                                            show: true,
                                            drawHorizontalLine: true,
                                            drawVerticalLine: false,
                                            horizontalInterval: 1.0,
                                          ),
                                          titlesData: FlTitlesData(
                                            leftTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget: (value, meta) {
                                                  return Text(
                                                    value.toInt().toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            rightTitles: const AxisTitles(),
                                            topTitles: const AxisTitles(),
                                            bottomTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                reservedSize: 22,
                                                getTitlesWidget: (value, meta) {
                                                  return Text(
                                                    (value.toInt() + 1)
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          lineTouchData: LineTouchData(
                                            touchTooltipData:
                                                LineTouchTooltipData(
                                              getTooltipItems: (touchedSpots) {
                                                return touchedSpots.map(
                                                  (spot) {
                                                    final dayIndex =
                                                        spot.x.toInt();
                                                    final count =
                                                        spot.y.toInt();
                                                    final date =
                                                        datesMap[dayIndex]!;
                                                    return LineTooltipItem(
                                                      'Date: $date\nUsers: $count',
                                                      const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    );
                                                  },
                                                ).toList();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          // User Stats Row
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  child: StatCard(
                                    title: 'Total User',
                                    value: '${userController.allUsers?.length}',
                                    icon: Icons.group,
                                    color: Themecolor.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: StatCard(
                                    title: 'Active User',
                                    value:
                                        '${userController.allUsers?.where((e) => e.status == "Active").toList().length}',
                                    icon: Icons.person,
                                    color: Themecolor.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: StatCard(
                                    title: 'Inactive User',
                                    value:
                                        '${userController.allUsers?.where((e) => e.status == "InActive").toList().length}',
                                    icon: Icons.person_off,
                                    color: Themecolor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  // Gender Stats Row
                  Row(
                    children: [
                      Expanded(
                        child: StatCard2(
                          title: 'Male Users',
                          value:
                              '${userController.allUsers?.where((e) => e.gender == "male").toList().length}',
                          icon: Icons.male,
                          color: Themecolor.white,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: StatCard2(
                          title: 'Female Users',
                          value:
                              '${userController.allUsers?.where((e) => e.gender == "female").toList().length}',
                          icon: Icons.female,
                          color: Themecolor.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          loading() ? LoadingWidget() : const SizedBox()
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: const EdgeInsets.all(10.0),
      // elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FittedBox(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Icon(icon, color: color, size: 36)),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCard2 extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard2({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, boxShadow: const [
        BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 0.5,
            spreadRadius: 1.0,
            color: Colors.black26)
      ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Themecolor.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Themecolor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Container(
                color: Themecolor.primaryColor,
                width: 40,
                height: 40,
                child: Icon(icon, color: color, size: 36)),
          ],
        ),
      ),
    );
  }
}
