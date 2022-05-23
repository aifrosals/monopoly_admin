import 'package:flutter/material.dart';

class SingleSlotEditButton extends StatelessWidget {
  const SingleSlotEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.create_rounded, color: Colors.white),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return Colors.grey; // <-- Splash color
        }),
      ),
    );
  }
}
