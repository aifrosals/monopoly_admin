import 'package:flutter/material.dart';

class MessageDialogUi extends StatelessWidget {
  const MessageDialogUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Error saving template'),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'))
    ]);
  }
}
