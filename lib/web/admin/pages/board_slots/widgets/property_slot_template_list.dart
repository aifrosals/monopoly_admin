import 'package:flutter/material.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/add_property_template_dialog.dart';

class PropertySlotTemplateList extends StatelessWidget {
  const PropertySlotTemplateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          children: const [
            TableRow(
                children: [
                  Center(child: Text(
                    'Name', style: TextStyle(fontWeight: FontWeight.bold),)),
                  Center(child: Text(
                    'Image', style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(),
                  SizedBox(),
                ]
            )
          ],
        ),
      ),
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
