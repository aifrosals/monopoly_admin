import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/api/api_constants.dart';
import 'package:monopoly_admin/models/admin.dart';
import 'package:monopoly_admin/models/slot.dart';
import 'package:monopoly_admin/config/values.dart';
import 'package:http/http.dart' as http;
import 'package:monopoly_admin/web/widgets/web_dialog.dart';
import 'dart:math' as math;
import 'package:monopoly_admin/config/extensions.dart';

class BoardProvider extends ChangeNotifier {
  List<Slot> _slots = [];

  List<Slot> _editableSlots = [];

  bool _slotsLoading = false;

  bool _editSlots = false;

  getBoardSlots(Admin admin) async {
    await Future.delayed(Duration.zero);
    _slotsLoading = true;
    notifyListeners();
    try {
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
          response.statusCode == 405) {} else {
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

  saveEditableSlots(Admin admin) async {
    try {
      await Future.delayed(Duration.zero);
      _slotsLoading = true;
      notifyListeners();
      String slots = json.encode(_editableSlots);
      Uri url =
          Uri.parse('${ApiConstants.domain}${ApiConstants.saveEditableSlots}');
      var body = {'slots': slots};
      debugPrint('$url');
      var response = await http.post(
        url,
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': admin.token
        },
      );
      debugPrint('BoardProvider saveEditableSlots ${response.body}');
      if (response.statusCode == 200) {
        WebDialog.showServerResponseDialog(response.body);
        cancelEdit();
        getBoardSlots(admin);
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 402 ||
          response.statusCode == 403 ||
          response.statusCode == 405) {
        showDialog(
            context: Values.navigatorKey.currentContext!,
            builder: (context) =>
                WebDialog.showServerResponseDialog(response.body));
      } else {
        showDialog(
            context: Values.navigatorKey.currentContext!,
            builder: (context) => WebDialog.showServerResponseDialog(
                'Error ${response.statusCode}'));
      }
    } catch (error, st) {
      debugPrint('BoardProvider saveEditableSlots $error $st');
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
    _editableSlots = List.from(_slots);
    notifyListeners();
  }

  cancelEdit() {
    _editableSlots = [];
    _editSlots = false;
    notifyListeners();
  }

  rearrangeListAction(int oldIndex, int newIndex) {
    if (oldIndex != 0 && oldIndex != _editableSlots.length - 1) {
      if (newIndex > oldIndex) {
        newIndex = newIndex - 1;
      }
      final element = _editableSlots.removeAt(oldIndex);
      _editableSlots.insert(newIndex, element);
      rearrangeList();
    }
  }

  deleteSlot(int index) {
    if (index != 0 && index != _editableSlots.length - 1) {
      _editableSlots.removeAt(index);
      rearrangeList();
    }
  }

  addSlot(int index, String type) {
    if (index != 0 && index != _editableSlots.length - 1) {
      _editableSlots.insert(index, getSlotByType(type, index));
      rearrangeList();
    }
  }

  rearrangeList() {
    for (int i = 0; i < _editableSlots.length; i++) {
      _editableSlots[i].index = i;
    }
    notifyListeners();
  }

  getSlotByType(String type, int index) {
    switch (type) {
      case 'Land':
        {
          return Slot(
              initialType: 'land',
              color: getRandomColor(),
              name: 'For Sell',
              type: 'land',
              index: index,
              price: 50,
              level: 0);
        }
      case 'Black Hole':
        {
          return Slot(
              initialType: 'black_hole',
              index: index,
              type: 'black_hole',
              color: '#45818e'.toColor(),
              name: 'Black Hole');
        }
      case 'Worm Hole':
        {
          return Slot(
              initialType: 'worm_hole',
              index: index,
              type: 'worm_hole',
              color: '#45818e'.toColor(),
              name: 'Worm Hole');
        }
      case 'Chance':
        {
          return Slot(
              initialType: 'chance',
              index: index,
              type: 'chance',
              color: '#45818e'.toColor(),
              name: 'Chance');
        }
      case 'Challenge':
        {
          return Slot(
              initialType: 'challenge',
              index: index,
              type: 'challenge',
              color: '#2d3132'.toColor(),
              name: 'Challenge');
        }
      case 'Community Chest':
        {
          return Slot(
              initialType: 'chest',
              index: index,
              type: 'chest',
              color: '#45818e'.toColor(),
              name: 'Community Chest');
        }
      case 'Treasure Hunt':
        {
          return Slot(
              initialType: 'treasure_hunt',
              index: index,
              type: 'treasure_hunt',
              color: '#3d17a0'.toColor(),
              name: 'Treasure Hunt');
        }
      case 'RM Reward':
        {
          return Slot(
              initialType: 'reward',
              index: index,
              type: 'reward',
              color: '#3d17a0'.toColor(),
              name: 'RM Reward 50');
        }
      default:
        {
          return Slot(
              initialType: 'land',
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              name: 'For Sell',
              type: 'land',
              index: index,
              price: 50,
              level: 0);
        }
    }
  }

  Color getRandomColor() {
    List<Color> colors = [
      const Color(0xfff1c232),
      const Color(0xff43AA8B),
      const Color(0xff45818e),
      const Color(0xff3d17a0),
      const Color(0xff219EBC),
      const Color(0xffFF595E),
      const Color(0xffF3722C),
      const Color(0xffFF5733),
      const Color(0xff6A4C93),
      const Color(0xff4c9480),
      const Color(0xff944c8b),
      const Color(0xff86ff57),
      const Color(0xffff57a0)
    ];
    int index = math.Random().nextInt(colors.length);
    return colors[index];
  }

  List<Slot> get slots => _slots;

  List<Slot> get editableSlots => _editableSlots;

  bool get slotLoading => _slotsLoading;

  bool get editSlots => _editSlots;
}
