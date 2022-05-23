import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class DashboardSmallScreen extends StatelessWidget {
  const DashboardSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
      return dashboardProvider
          .getMainWidgets(dashboardProvider.mainWidgetIndex);
    });
  }
}
