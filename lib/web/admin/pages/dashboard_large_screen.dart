import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/providers/dashboard_provider.dart';
import 'package:monopoly_admin/web/widgets/side_bar/side_bar.dart';
import 'package:provider/provider.dart';

class DashboardLargeScreen extends StatelessWidget {
  const DashboardLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Material(
              color: Colors.grey[300],
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: SideBar(),
              )),
          ),
          Expanded(flex: 10, child: Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, child) {
              return dashboardProvider
                  .getMainWidgets(dashboardProvider.mainWidgetIndex);
            }))
        ],
      );
  }

}
