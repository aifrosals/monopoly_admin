import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:monopoly_admin/web/widgets/web_dialog.dart';

import '../api/api_constants.dart';

class ResetPasswordProvider extends ChangeNotifier {
  bool _loading = false;
  resetPassword(String email, String password) async {
    _loading = true;
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
      _loading = false;
      notifyListeners();
    }
  }

  bool get loading => _loading;
}