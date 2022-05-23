import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/api/api_constants.dart';
import 'package:monopoly_admin/models/admin.dart';
import 'package:monopoly_admin/models/slot.dart';
import 'package:monopoly_admin/config/values.dart';
import 'package:http/http.dart' as http;
import 'package:monopoly_admin/web/widgets/web_dialog.dart';

class BoardProvider extends ChangeNotifier {
  List<Slot> _slots = [];

  List<Slot> _editableSlots = [];

  bool _slotsLoading = false;

  bool _editSlots = false;

  getBoardSlots(Admin admin) async {
    _slotsLoading = true;
    notifyListeners();
    try {
      debugPrint('called');
      Uri url = Uri.parse('${ApiConstants.domain}${ApiConstants.slots}');
      // var body = {'id': id};
      debugPrint('$url');
      var response = await http.get(
        url,
        // body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': admin.token
        },
      );
      debugPrint('BoardProvider getBoardSlots ${response.body}');
      if (response.statusCode == 200) {
        var resData = json.decode(response.body) as List;
        _slots = resData.map((e) => Slot.fromJson(e)).toList();
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 402 ||
          response.statusCode == 403 ||
          response.statusCode == 405) {
      } else {
        showDialog(
            context: Values.navigatorKey.currentContext!,
            builder: (context) => WebDialog.showServerResponseDialog(
                'Error ${response.statusCode}'));
      }
    } catch (error, st) {
      debugPrint('BoardProvider $error $st');
      showDialog(
          context: Values.navigatorKey.currentContext!,
          builder: (context) =>
              WebDialog.showServerResponseDialog('Unknown error'));
    } finally {
      _slotsLoading = false;
      notifyListeners();
    }
  }

  setSlotsForEdit() {
    _editSlots = true;
    _editableSlots = _slots;
    notifyListeners();
  }

  cancelEdit() {
    _editSlots = false;
    notifyListeners();
  }

  rearrangeList(int oldIndex, int newIndex) {
    if (oldIndex != 0 && oldIndex != _editableSlots.last.index) {
      if (newIndex > oldIndex) {
        newIndex = newIndex - 1;
      }
      final element = _editableSlots.removeAt(oldIndex);
      _editableSlots.insert(newIndex, element);
      notifyListeners();
    }
  }

  List<Slot> get slots => _slots;

  List<Slot> get editableSlots => _editableSlots;

  bool get slotLoading => _slotsLoading;

  bool get editSlots => _editSlots;
}
