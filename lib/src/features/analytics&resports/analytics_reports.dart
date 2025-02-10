import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';
import 'analytics_controller.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<AnalyticsController>(); // Controller is already available

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics and Report'),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  controller.isFilterApplied.value
                      ? Icons.filter_alt
                      : Icons.filter_alt_outlined,
                  color: Themecolor.primaryColor,
                ),
                onPressed: controller.toggleFilter,
              )),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return DesktopLayout(controller: controller);
            } else {
              return MobileLayout(controller: controller);
            }
          },
        );
      }),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  final AnalyticsController controller;

  const DesktopLayout({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<AnalyticsController>(); // Fetch the controller directly

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: controller.toggleFilter,
                icon: const Icon(Icons.filter_alt,
                    color: Themecolor.primaryColor),
                label: const Text('Filter',
                    style: TextStyle(color: Themecolor.primaryColor)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _CardWidget(
                  title: 'User Engagement',
                  child: _BarChartWidget(data: controller.barChartData),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _CardWidget(
                  title: 'Matchmaking Success',
                  child: _LineChartWidget(
                    line1: controller.lineChartData1,
                    line2: controller.lineChartData2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Demographic Breakdown',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Bree Serif"),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text(
                  'Demographic data visualization will go here.',
                  style:
                      TextStyle(color: Colors.grey, fontFamily: "Bree Serif"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  final AnalyticsController controller;

  const MobileLayout({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: controller.toggleFilter,
              icon:
                  const Icon(Icons.filter_alt, color: Themecolor.primaryColor),
              label: const Text('Filter',
                  style: TextStyle(color: Themecolor.primaryColor)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _CardWidget(
          title: 'User Engagement',
          child: Obx(() => _BarChartWidget(data: controller.barChartData)),
        ),
        const SizedBox(height: 16),
        _CardWidget(
          title: 'Matchmaking Success',
          child: Obx(() => _LineChartWidget(
                line1: controller.lineChartData1,
                line2: controller.lineChartData2,
              )),
        ),
        const SizedBox(height: 16),
        const Text(
          'Demographic Breakdown',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Bree Serif"),
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          color: Colors.grey[200],
          child: const Center(
            child: Text(
              'Demographic data visualization will go here.',
              style: TextStyle(color: Colors.grey, fontFamily: "Bree Serif"),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const _CardWidget({required this.title, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Themecolor.primaryColor,
              fontFamily: "Bree Serif"),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 1.0,
                spreadRadius: 0.5,
                color: Colors.black)
          ]),
          height: 300,
          width: MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.8,
          child: child,
        ),
      ],
    );
  }
}

class _BarChartWidget extends StatelessWidget {
  final List<double> data;

  const _BarChartWidget({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        barGroups: data
            .asMap()
            .entries
            .map((e) => BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value,
                      color: Themecolor.primaryColor,
                      width: 54,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                    ),
                  ],
                ))
            .toList(),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(['Logins', 'Messages', 'Views'][value.toInt()]);
                }),
          ),
        ),
      ),
    );
  }
}

class _LineChartWidget extends StatelessWidget {
  final List<double> line1;
  final List<double> line2;

  const _LineChartWidget({required this.line1, required this.line2, super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: line1
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value))
                .toList(),
            isCurved: true,
            color: Themecolor.primaryColor,
            dotData: const FlDotData(show: false),
          ),
          LineChartBarData(
            spots: line2
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value))
                .toList(),
            isCurved: true,
            color: Themecolor.primaryColor.withOpacity(0.7),
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
