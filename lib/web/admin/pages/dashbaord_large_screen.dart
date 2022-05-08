import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/providers/dasboard_provider.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:monopoly_admin/web/admin/pages/challenge/challenge_menu.dart';
import 'package:provider/provider.dart';
import 'feedback/feedback_list.dart';
import 'stats/stats.dart';
import 'user/manage_user.dart';


class DashboardLargeScreen extends StatefulWidget {


  const DashboardLargeScreen({Key? key}) : super(key: key);

  @override
  _DashboardLargeScreen createState() => _DashboardLargeScreen();
}

class _DashboardLargeScreen extends State<DashboardLargeScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: Material(
              color: Colors.grey[300],
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
                          tileColor:
                              dashboardProvider.mainWidgetIndex == 0 ? WebPalette.primary : Colors.white,
                          trailing: Icon(
                            CupertinoIcons.news,
                            color: dashboardProvider.mainWidgetIndex == 0 ? Colors.white : WebPalette.primary,
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
                          tileColor:
                              dashboardProvider.mainWidgetIndex == 1 ? WebPalette.primary : Colors.white,
                          trailing: Icon(
                            CupertinoIcons.bolt_fill,
                            color: dashboardProvider.mainWidgetIndex == 1 ? Colors.white : WebPalette.primary,
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
                          tileColor:
                              dashboardProvider.mainWidgetIndex == 2 ? WebPalette.primary : Colors.white,
                          trailing: Icon(
                            CupertinoIcons.doc_person,
                            color: dashboardProvider.mainWidgetIndex == 2 ? Colors.white : WebPalette.primary,
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
                          tileColor:
                              dashboardProvider.mainWidgetIndex == 3 ? WebPalette.primary : Colors.white,
                          trailing: Icon(
                            CupertinoIcons.envelope,
                            color: dashboardProvider.mainWidgetIndex == 3 ? Colors.white : WebPalette.primary,
                          ),
                          onTap: () {

                              dashboardProvider.changePageIndex(3);

                          }),
                    ],
                  );
                }
              ),
            ),
          ),
          Expanded(flex: 10, child: Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, child) {
              return getMainWidgets(dashboardProvider.mainWidgetIndex);
            }
          ))
        ],
      );
  }

  getMainWidgets(int index) {
    switch (index) {
      case 0:
        {
          return const Stats();
        }
      case 1:
        {
          return const ChallengeMenu();
        }
      case 2:
        {
          return const ManageUserPage();
        }
      case 3:
        {
          return const FeedbackList();
        }
    }
  }
}
