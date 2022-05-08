import 'package:flutter/cupertino.dart';

class DashboardProvider extends ChangeNotifier {
  int _mainWidgetIndex = 0;

  changePageIndex(int index) {
    _mainWidgetIndex = index;
    notifyListeners();
  }

  int get mainWidgetIndex => _mainWidgetIndex;

}