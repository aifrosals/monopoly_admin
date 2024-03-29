import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/edit_slot_dialog.dart';
import 'package:monopoly_admin/web/widgets/color_picker.dart';
import 'package:provider/provider.dart';

class EditSlotButton extends StatelessWidget {
  final int index;

  const EditSlotButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardProvider = Provider.of<BoardProvider>(context, listen: false);

    return ElevatedButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) => EditSlotDialog(
              index: index, slot: boardProvider.editableSlots[index]),
        );
      },
      child: const Icon(Icons.create_rounded, color: Colors.white),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey;
          } // <-- Splash color
        }),
      ),
    );
  }
}
