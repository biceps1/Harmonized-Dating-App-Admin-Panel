import 'package:flutter/material.dart';
import 'package:harmonized_admin/src/core/components/my_drawer.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';
import 'package:sidebarx/sidebarx.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          backgroundColor: Themecolor.whitehalf,
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: Themecolor.white,
                  title: Text(getTitleByIndex(_controller.selectedIndex)),
                  leading: IconButton(
                    onPressed: () {
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: MyDrawer(
            onItemTapped: (index) {
              _controller.selectIndex(index);
            },
            controller: _controller,
          ),
          body: Row(
            children: [
              if (!isSmallScreen)
                MyDrawer(
                  onItemTapped: (index) {
                    _controller.selectIndex(index);
                  },
                  controller: _controller,
                ),
              Expanded(
                child: Center(
                  child: DrawersScreens(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
