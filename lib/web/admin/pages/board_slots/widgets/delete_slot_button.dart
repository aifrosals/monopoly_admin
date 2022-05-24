import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:provider/provider.dart';

class DeleteSlotButton extends StatelessWidget {
  final int index;

  const DeleteSlotButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardProvider = Provider.of<BoardProvider>(context, listen: false);

    return ElevatedButton(
      onPressed: () => boardProvider.deleteSlot(index),
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
