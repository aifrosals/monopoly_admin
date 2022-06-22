import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/api/api_constants.dart';
import 'package:monopoly_admin/models/admin.dart';
import 'package:http/http.dart' as http;

class PSlotTemplateProvider extends ChangeNotifier {
  addTemplate(File file, Admin admin) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-access-token': admin.token
    };
    var request = http.MultipartRequest("POST",
        Uri.parse(
            "${ApiConstants.domain}${ApiConstants.addTemplate}"));
    request.headers.addAll(headers);
    // request.fields["user"] = json.encode(user);

    request.files.add(
        await http.MultipartFile.fromPath('file', file.path));

    // request.files.add(pic);
    var response = await request.send();
    //debugPrint(" imageSend response $response");

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    // print('uploadFeedback $responseString');
    //print('response: $responseString');
    var parsedJson = json.decode(responseString);
  }
}