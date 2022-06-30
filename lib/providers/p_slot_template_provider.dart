import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/api/api_constants.dart';
import 'package:monopoly_admin/models/admin.dart';
import 'package:http/http.dart' as http;
import 'package:monopoly_admin/models/property_template.dart';
import 'package:monopoly_admin/web/widgets/web_dialog.dart';

class PSlotTemplateProvider extends ChangeNotifier {
  List<PropertyTemplate> _templates = [];

  bool _templateLoading = false;

  bool _saveLoading = false;

  String _error = '';

  addTemplate(
      Uint8List bytes, Admin admin, int level, String displayName) async {
    //TODO add restriction for only images
    try {
      await Future.delayed(Duration.zero);
      _error = '';
      _saveLoading = true;
      _templateLoading = true;
      notifyListeners();
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'x-access-token': admin.token
      };
      var request = http.MultipartRequest("POST",
          Uri.parse("${ApiConstants.domain}${ApiConstants.addTemplate}"));
      request.headers.addAll(headers);
      request.fields['data'] =
          json.encode({'level': level, 'displayName': displayName});

      request.files.add(http.MultipartFile.fromBytes(
        'file',
        bytes,
      ));

      // request.files.add(pic);
      var response = await request.send();
      //debugPrint(" imageSend response $response");
      debugPrint('status code ${response.statusCode}');
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      //print('response: $responseString');
      debugPrint(responseString);
      if (response.statusCode != 200) {
        _error = responseString;
      }
      // var parsedJson = json.decode(responseString);
    } catch (e, st) {
      _error = 'Unknown error';
      debugPrint('error $e $st');
    } finally {
      _saveLoading = false;
      notifyListeners();
      getTemplatesByLevel(level, admin);
    }
  }

  clearTemplate() {
    _templates = [];
    notifyListeners();
  }

  getTemplatesByLevel(int level, Admin admin) async {
    try {
      //  await Future.delayed(Duration.zero);
      _templateLoading = true;
      _templates = [];
      notifyListeners();
      Uri url =
          Uri.parse('${ApiConstants.domain}${ApiConstants.getTemplateByLevel}');
      debugPrint('$url');
      String body = jsonEncode({'level': level});
      var response = await http.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': admin.token
        },
      );
      debugPrint('getTemplates response ${response.body}');
      if (response.statusCode == 200) {
        var resData = json.decode(response.body) as List;
        _templates = resData.map((e) => PropertyTemplate.fromJson(e)).toList();
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 402 ||
          response.statusCode == 403 ||
          response.statusCode == 405) {
        WebDialog.showServerResponseDialog(response.body);
      } else {
        WebDialog.showServerResponseDialog('Unknown Server Error');
      }
    } catch (error, st) {
      debugPrint('getTemplateByLevel $error $st');
    } finally {
      _templateLoading = false;
      notifyListeners();
    }
  }

  activateTemplateByLevel(PropertyTemplate template, Admin admin) async {
    try {
      //  await Future.delayed(Duration.zero);
      _templateLoading = true;
      _templates = [];
      notifyListeners();
      Uri url = Uri.parse(
          '${ApiConstants.domain}${ApiConstants.activateTemplateByLevel}');
      debugPrint('$url');
      String body = jsonEncode({'id': template.id, 'level': template.level});
      var response = await http.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': admin.token
        },
      );
      debugPrint('activateTemplateByLevel response ${response.body}');
      if (response.statusCode == 200) {
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 402 ||
          response.statusCode == 403 ||
          response.statusCode == 405) {
        WebDialog.showServerResponseDialog(response.body);
      } else {
        WebDialog.showServerResponseDialog('Unknown Server Error');
      }
    } catch (error, st) {
      debugPrint('activateTemplateByLevel $error $st');
    } finally {
      _templateLoading = false;
      notifyListeners();
      getTemplatesByLevel(template.level, admin);
    }
  }

  deactivateTemplate(PropertyTemplate template, Admin admin) async {
    try {
      //  await Future.delayed(Duration.zero);
      _templateLoading = true;
      _templates = [];
      notifyListeners();
      Uri url =
          Uri.parse('${ApiConstants.domain}${ApiConstants.deactivateTemplate}');
      debugPrint('$url');
      String body = jsonEncode({'id': template.id});
      var response = await http.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': admin.token
        },
      );
      debugPrint('deactivateTemplate response ${response.body}');
      if (response.statusCode == 200) {
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 402 ||
          response.statusCode == 403 ||
          response.statusCode == 405) {
        WebDialog.showServerResponseDialog(response.body);
      } else {
        WebDialog.showServerResponseDialog('Unknown Server Error');
      }
    } catch (error, st) {
      debugPrint('deactivateTemplate $error $st');
    } finally {
      _templateLoading = false;
      notifyListeners();
      getTemplatesByLevel(template.level, admin);
    }
  }

  List<PropertyTemplate> get templates => _templates;

  bool get templateLoading => _templateLoading;

  bool get saveLoading => _saveLoading;

  String get error => _error;
}