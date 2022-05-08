import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/providers/dasboard_provider.dart';
import 'package:monopoly_admin/web/admin/pages/challenge/challenge_menu.dart';
import 'package:monopoly_admin/web/admin/pages/feedback/feedback_list.dart';
import 'package:monopoly_admin/web/admin/pages/stats/stats.dart';
import 'package:monopoly_admin/web/admin/pages/user/manage_user.dart';
import 'package:provider/provider.dart';

class DashboardSmallScreen extends StatefulWidget {
  const DashboardSmallScreen({Key? key}) : super(key: key);

  @override
  State<DashboardSmallScreen> createState() => _DashboardSmallScreenState();
}

class _DashboardSmallScreenState extends State<DashboardSmallScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        return getMainWidgets(dashboardProvider.mainWidgetIndex);
      }
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
