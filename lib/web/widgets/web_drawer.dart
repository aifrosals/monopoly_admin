import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/dasboard_provider.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:provider/provider.dart';

class WebDrawer extends StatefulWidget {
  const WebDrawer({Key? key}) : super(key: key);

  @override
  State<WebDrawer> createState() => _WebDrawerState();
}

class _WebDrawerState extends State<WebDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, child) {
          return Column(
            children: [
              ListTile(
                  title: Text('Stats',
                      style: TextStyle(
                          color: dashboardProvider.mainWidgetIndex == 0
                              ? Colors.white
                              : WebPalette.primary)),
                  tileColor: dashboardProvider.mainWidgetIndex == 0
                      ? WebPalette.primary
                      : Colors.white,
                  trailing: Icon(
                    CupertinoIcons.news,
                    color: dashboardProvider.mainWidgetIndex == 0
                        ? Colors.white
                        : WebPalette.primary,
                  ),
                  onTap: () {
                      dashboardProvider.changePageIndex(0);

                  }),
              ListTile(
                  title: Text('Challenge',
                      style: TextStyle(
                          color: dashboardProvider.mainWidgetIndex == 1
                              ? Colors.white
                              : WebPalette.primary)),
                  tileColor: dashboardProvider.mainWidgetIndex == 1
                      ? WebPalette.primary
                      : Colors.white,
                  trailing: Icon(
                    CupertinoIcons.bolt_fill,
                    color: dashboardProvider.mainWidgetIndex == 1
                        ? Colors.white
                        : WebPalette.primary,
                  ),
                  onTap: () {
                      dashboardProvider.changePageIndex(1);

                  }),
              ListTile(
                  title: Text('Users',
                      style: TextStyle(
                          color: dashboardProvider.mainWidgetIndex == 2
                              ? Colors.white
                              : WebPalette.primary)),
                  tileColor: dashboardProvider.mainWidgetIndex == 2
                      ? WebPalette.primary
                      : Colors.white,
                  trailing: Icon(
                    CupertinoIcons.doc_person,
                    color: dashboardProvider.mainWidgetIndex == 2
                        ? Colors.white
                        : WebPalette.primary,
                  ),
                  onTap: () {
                      dashboardProvider.changePageIndex(2);

                  }),
              ListTile(
                  title: Text('Message',
                      style: TextStyle(
                          color: dashboardProvider.mainWidgetIndex == 3
                              ? Colors.white
                              : WebPalette.primary)),
                  tileColor: dashboardProvider.mainWidgetIndex == 3
                      ? WebPalette.primary
                      : Colors.white,
                  trailing: Icon(
                    CupertinoIcons.envelope,
                    color: dashboardProvider.mainWidgetIndex == 3
                        ? Colors.white
                        : WebPalette.primary,
                  ),
                  onTap: () {
                      dashboardProvider.changePageIndex(3);

                  }),
            ],
          );
        }),
      ),
    );
  }
}
