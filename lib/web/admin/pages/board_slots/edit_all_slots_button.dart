import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:provider/provider.dart';

class EditAllSlotsButton extends StatelessWidget {
  const EditAllSlotsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardProvider = Provider.of<BoardProvider>(context, listen: false);
    return SizedBox(
      height: 40,
      child: ElevatedButton(
          onPressed: () => boardProvider.setSlotsForEdit(),
          child: const Text(
            'Edit Slots',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
