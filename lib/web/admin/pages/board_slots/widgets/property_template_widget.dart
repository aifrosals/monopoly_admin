import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/property_template.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/providers/p_slot_template_provider.dart';
import 'package:provider/provider.dart';

class PropertyTemplateWidget extends StatelessWidget {
  final PropertyTemplate template;

  const PropertyTemplateWidget({Key? key, required this.template})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pSlotTemplateProvider =
        Provider.of<PSlotTemplateProvider>(context, listen: false);
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Image.network(
                  template.imageUrl,
                  height: 100,
                  width: 100,
                )),
              ),
              Center(
                  child: Column(
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(template.displayName),
                ],
              )),
              Center(
                child: Column(
                  children: [
                    const Text('Activate'),
                    CupertinoSwitch(
                        value: template.active,
                        onChanged: (value) {
                          if (template.active) {
                            pSlotTemplateProvider.deactivateTemplate(
                                template, adminProvider.admin!);
                          } else {
                            pSlotTemplateProvider.activateTemplateByLevel(
                                template, adminProvider.admin!);
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(),
            ])
          ],
        ),
      ),
    );
  }
}
