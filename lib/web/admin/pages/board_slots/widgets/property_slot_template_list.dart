import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/p_slot_template_provider.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/add_property_template_dialog.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/property_template_widget.dart';
import 'package:provider/provider.dart';

class PropertySlotTemplateList extends StatelessWidget {
  final int level;

  const PropertySlotTemplateList({Key? key, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<PSlotTemplateProvider>(
            builder: (context, pSlotTemplateProvider, child) {
          if (pSlotTemplateProvider.templateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: pSlotTemplateProvider.templates.length,
                itemBuilder: (context, index) => PropertyTemplateWidget(
                    template: pSlotTemplateProvider.templates[index]));
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WebPalette.primary,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AddPropertyTemplateDialog(
                    level: level,
                  ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
