import 'package:flutter/material.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/property_slot_template_list.dart';

class PropertySlotTemplateMain extends StatefulWidget {
  const PropertySlotTemplateMain({Key? key}) : super(key: key);

  @override
  State<PropertySlotTemplateMain> createState() =>
      _PropertySlotTemplateMainState();
}

class _PropertySlotTemplateMainState extends State<PropertySlotTemplateMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Text('Property Levels'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Level 0',
              ),
              Tab(
                text: 'Level 1',
              ),
              Tab(
                text: 'Level 2',
              ),
              Tab(
                text: 'Level 3',
              ),
              Tab(
                text: 'Level 4',
              ),
              Tab(
                text: 'Level 5',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            PropertySlotTemplateList(
              level: 0,
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
