import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/api/api_constants.dart';
import 'package:monopoly_admin/models/admin.dart';
import 'package:http/http.dart' as http;

class PSlotTemplateProvider extends ChangeNotifier {
  addTemplate(
      Uint8List bytes, Admin admin, int level, String displayName) async {
    //TODO add restriction for only images
    try {
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
      // var parsedJson = json.decode(responseString);
    } catch (e, st) {
      debugPrint('error $e $st');
    }
  }
}