import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/components/custom_animated_button.dart';
import 'package:harmonized_admin/src/core/components/divider_section.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';
import 'package:harmonized_admin/src/features/analytics&resports/analytics_reports.dart';
import 'package:harmonized_admin/src/features/auth/change_password/change_password_screen.dart';
import 'package:harmonized_admin/src/features/auth/login/login_screen.dart';
import 'package:harmonized_admin/src/features/content_moderation/content_moderation_screen.dart';
import 'package:harmonized_admin/src/features/dashboard/dashboard.dart';
import 'package:harmonized_admin/src/features/user_management/user_management_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'responsive.dart';

class MyDrawer extends StatelessWidget {
  final Function(int) onItemTapped;
  final SidebarXController controller;

  const MyDrawer({
    super.key,
    required this.onItemTapped,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Themecolor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Themecolor.white,
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 10),
        selectedItemTextPadding: const EdgeInsets.only(left: 10),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Themecolor.white),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              colors: [Themecolor.white, Themecolor.white]),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Themecolor.primaryColor,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        itemDecoration: BoxDecoration(
            color: Themecolor.primaryColor,
            borderRadius: BorderRadius.circular(62),
            border: Border.all(color: Colors.white, width: 2.0)),
        selectedIconTheme: const IconThemeData(color: Themecolor.primaryColor),
        iconTheme: const IconThemeData(color: Themecolor.white),
        selectedTextStyle: const TextStyle(
            color: Themecolor.primaryColor, fontFamily: "Bree Serif"),
        textStyle:
            const TextStyle(color: Themecolor.white, fontFamily: "Bree Serif"),
        selectedItemDecoration: BoxDecoration(
          color: Themecolor.white,
          borderRadius: BorderRadius.circular(60),
        ),
        hoverColor: Themecolor.white,
        hoverTextStyle: const TextStyle(
            color: Themecolor.primaryColor, fontFamily: "Bree Serif"),
        width: 250,
        decoration: const BoxDecoration(
            color: Themecolor.primaryColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40))),
      ),
      headerDivider: const DividerSection(),
      footerDivider: IconButton(
        icon: FittedBox(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Themecolor.primaryColor,
              border: Border.all(color: Colors.white),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                Text(
                  "Logout",
                  style:
                      TextStyle(color: Colors.white, fontFamily: "Bree Serif"),
                )
              ],
            ),
          ),
        ),
        onPressed: () {
          onItemTapped(7);
          if (!Responsive.isDesktop(context)) {
            Navigator.pop(context);
          }
        },
      ),
      collapseIcon: Icons.arrow_back_ios_new_outlined,
      headerBuilder: (context, extended) {
        return FittedBox(
          child: SizedBox(
            height: context.height / 4.5,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 40),
              child: Text(
                "Harmonized",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: "Lilita One"),
              ),
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
          onTap: () {
            onItemTapped(0);
            if (!Responsive.isDesktop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        SidebarXItem(
          icon: Icons.people,
          label: 'User Management',
          onTap: () {
            onItemTapped(1);
            if (!Responsive.isDesktop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        SidebarXItem(
          icon: Icons.edit_outlined,
          label: 'Content  Moderation',
          onTap: () {
            onItemTapped(2);
            if (!Responsive.isDesktop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        SidebarXItem(
          icon: Icons.report_sharp,
          label: 'Analytics and Reports',
          onTap: () {
            onItemTapped(3);
            if (!Responsive.isDesktop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}

class DrawersScreens extends StatelessWidget {
  const DrawersScreens({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return  DashboardScreen(); // Your custom Dashboard screen
          case 1:
            return  UserManagementScreen(); // Your custom Blogs screen
          case 2:
            return ContentModerationDashboard(); // Your custom Promotions screen
          case 3:
            return  AnalyticsScreen(); // Your custom Ads screen
            // return DashboardScreen(); // Your custom Dashboard screen
 // Your custom Promotions screen
          // case 3:
          //   return AdsScreen(); // Your custom Ads screen
          // case 4:
          //   return const CoinsScreen(); // Your custom Coins screen
          // case 5:
          //   return const PacakgesScreen(); // Your custom Packages screen
          case 6:
            return const ChangePasswordPage(); // Your custom Packages screen
          case 7:
            return const LogoutAlert(); // Stay on the same index for Logout
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'User Management';
    case 2:
      return 'Content Moderation';
    case 3:
      return 'Analytics and Reports';

    default:
      return 'Not Found';
  }
}

class LogoutAlert extends StatefulWidget {
  const LogoutAlert({super.key});

  @override
  State<LogoutAlert> createState() => _LogoutAlertState();
}

class _LogoutAlertState extends State<LogoutAlert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop(context)
          ? context.width / 5
          : context.width / 1.5,
      height: context.height / 3,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Logout Confirmation',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('Are you sure you want to log out?'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomAnimatedButton(
                  text: 'Logout',
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Get.offAll(() => const LoginScreen());
                  })
            ],
          ),
        ],
      ),
    );
  }
}
