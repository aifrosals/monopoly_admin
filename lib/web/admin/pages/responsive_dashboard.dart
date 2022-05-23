import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/web/admin/pages/dashboard_small_screen.dart';
import 'package:monopoly_admin/web/admin/pages/dashboard_large_screen.dart';
import 'package:monopoly_admin/web/widgets/logout_button.dart';
import 'package:monopoly_admin/web/widgets/side_bar/side_bar_drawer.dart';

class ResponsiveDashboard extends StatelessWidget {
  static const String route = '/dashboard';

  const ResponsiveDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      drawer: ScreenConfig.screenWidth <= 800 ? const SideBarDrawer() : null,
      appBar: ScreenConfig.screenWidth <= 800
          ? AppBar(
              title: const Text('Welcome to Dashboard'),
              actions: const [
                LogoutButton(),
              ],
            )
          : PreferredSize(
              child: AppBar(
                title: const Text('Welcome to Dashboard'),
                actions: const [
                  LogoutButton(),
                ],
              ),
              preferredSize: Size(ScreenConfig.screenWidth, 50),
            ),
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
