import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:monopoly_admin/api/api_constants.dart';
import 'package:monopoly_admin/models/admin.dart';
import 'package:monopoly_admin/web/widgets/web_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminProvider extends ChangeNotifier {
  Admin? _admin;

  bool _sessionLoading = false;

  bool _loginLoading = false;

  AdminProvider() {
    checkSession();
  }

  Future<bool> login(String email, String password) async {
    _loginLoading = true;
    notifyListeners();
    try {
      Uri uri = Uri.parse('${ApiConstants.domain}${ApiConstants.adminLogin}');
      Map body = {
        'email': email,
        'password': password,
      };
      var response = await http.post(
        uri,
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*"
          // HttpHeaders.authorizationHeader: 'Bearer ${user.token}'
          //'${user.token}',
        },
      );
      debugPrint('result received ${response.statusCode} ${response.body}');
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        _admin = Admin.fromJson(data);
        await saveSession(_admin!);
        return true;
      } else {
        WebDialog.showServerResponseDialog(response.body);
        return false;
      }
    } catch (error, st) {
      debugPrint('adminProvider login error $error $st');
      WebDialog.showServerResponseDialog('Unknown error occurred');
      return false;
    } finally {
      _loginLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkSession() async {
    try {
      debugPrint('admin checkSession called');
      _sessionLoading = true;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? saved = prefs.getString('admin');
      if (saved != null) {
        var data = json.decode(saved);
        _admin = Admin.fromJson(data);
      }
    } catch (error, st) {
      WebDialog.showServerResponseDialog('Unknown error occurred code: s100');
      debugPrint('Admin checkSession error $error $st');
    } finally {
      _sessionLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveSession(Admin admin) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String data = json.encode(admin.toJson());
      await prefs.setString('admin', data);
    } catch (error, st) {
      debugPrint('Admin saveSession error $error $st');
      rethrow;
    }
  }

  Future<void> deleteSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await prefs.clear();
  }

  logout() {
    deleteSession();
  }

  Admin? get admin => _admin;

  bool get sessionLoading => _sessionLoading;

  bool get loginLoading => _loginLoading;
}
