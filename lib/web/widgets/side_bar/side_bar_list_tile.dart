import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/dashboard_provider.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:provider/provider.dart';

class SideBarListTile extends StatelessWidget {
  const SideBarListTile(
      {Key? key, required this.title, required this.index, required this.icon})
      : super(key: key);
  final String title;
  final int index;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
      return ListTile(
          title: Text(title,
              style: TextStyle(
                  color: dashboardProvider.mainWidgetIndex == index
                      ? Colors.white
                      : WebPalette.primary)),
          tileColor: dashboardProvider.mainWidgetIndex == index
              ? WebPalette.primary
              : Colors.white,
          trailing: Icon(
            icon,
            color: dashboardProvider.mainWidgetIndex == index
                ? Colors.white
                : WebPalette.primary,
          ),
          onTap: () {
            dashboardProvider.changePageIndex(index);
          });
    });
  }
}
