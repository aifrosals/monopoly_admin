import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/web/admin/pages/dasboard_small_screen.dart';
import 'package:monopoly_admin/web/admin/pages/dashbaord_large_screen.dart';
import 'package:monopoly_admin/web/widgets/web_drawer.dart';

class ResponsiveDashboard extends StatelessWidget {
  static const String route = '/dashboard';

  const ResponsiveDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      drawer: ScreenConfig.screenWidth <= 800 ? const WebDrawer() : null,
      appBar:  ScreenConfig.screenWidth <= 800 ? AppBar(
        title: const Text('Welcome to Dashboard'),
      ):  PreferredSize(child: AppBar(title: const Text('Dashboard')), preferredSize: Size(ScreenConfig.screenWidth, 50),),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return const DashboardLargeScreen();
          } else if (constraints.maxWidth <= 1200 &&
              constraints.maxWidth >= 800) {
            return const DashboardLargeScreen();
          } else {
            return const DashboardSmallScreen();
          }
        },
      ),
    );


  }
}
