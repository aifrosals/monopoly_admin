import 'package:flutter/material.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/add_slot_dialog.dart';

class AddSlotButton extends StatelessWidget {
  final int index;

  const AddSlotButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog(
          context: context,
          builder: (context) => AddSlotDialog(
                index: index,
              )),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all(Colors.green),
        // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey;
          }
          return null; // <-- Splash color
        }),
      ),
    );
  }
}
