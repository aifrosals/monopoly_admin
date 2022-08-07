import 'dart:js';

import 'package:flutter/material.dart';

import 'package:monopoly_admin/config/values.dart';

class WebDialog {
  static showServerResponseDialog(String body) {
    showDialog(
        context: Values.adminNavigatorKey.currentContext!,
        builder: (context) => Dialog(
              child: SizedBox(
                height: 100,
                width: 500,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.cancel_outlined))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        body,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  static showLoadingDialog() {
    showDialog(
        context: Values.navigatorKey.currentContext!,
        builder: (context) =>
            Dialog(child: const Center(child: CircularProgressIndicator())));
  }

  static pop() {
    Navigator.pop(Values.navigatorKey.currentContext!);
  }
}
