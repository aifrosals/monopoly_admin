import 'package:flutter/material.dart';

class PropertyTemplate extends StatelessWidget {
  const PropertyTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Text('Name'),
          Text('Image'),
          SizedBox(),
          SizedBox(),
        ])
      ],
    );
  }
}
