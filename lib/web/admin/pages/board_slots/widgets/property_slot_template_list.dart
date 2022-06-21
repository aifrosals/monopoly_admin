import 'package:flutter/material.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/add_property_template_dialog.dart';

class PropertySlotTemplateList extends StatelessWidget {
  const PropertySlotTemplateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WebPalette.primary,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AddPropertyTemplateDialog());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
