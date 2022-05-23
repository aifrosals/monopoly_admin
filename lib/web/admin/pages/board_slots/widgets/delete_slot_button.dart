import 'package:flutter/material.dart';

class DeleteSlotButton extends StatelessWidget {
  const DeleteSlotButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.delete, color: Colors.white),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all(Colors.red),
        // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return Colors.grey; // <-- Splash color
        }),
      ),
    );
  }
}
