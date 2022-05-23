import 'package:flutter/cupertino.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/board_slot.dart';
import 'package:monopoly_admin/web/admin/pages/challenge/challenge_menu.dart';
import 'package:monopoly_admin/web/admin/pages/feedback/feedback_list.dart';
import 'package:monopoly_admin/web/admin/pages/stats/stats.dart';
import 'package:monopoly_admin/web/admin/pages/user/manage_user.dart';

class DashboardProvider extends ChangeNotifier {
  int _mainWidgetIndex = 0;

  changePageIndex(int index) {
    _mainWidgetIndex = index;
    notifyListeners();
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
          return const BoardSlot();
        }
      case 4:
        {
          return const FeedbackList();
        }
    }
  }

  int get mainWidgetIndex => _mainWidgetIndex;
}