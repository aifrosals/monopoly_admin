import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/providers/p_slot_template_provider.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/property_slot_template_list.dart';
import 'package:provider/provider.dart';

class PropertySlotTemplateMain extends StatefulWidget {
  const PropertySlotTemplateMain({Key? key}) : super(key: key);

  @override
  State<PropertySlotTemplateMain> createState() =>
      _PropertySlotTemplateMainState();
}

class _PropertySlotTemplateMainState extends State<PropertySlotTemplateMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final pSlotTemplateProvider =
        Provider.of<PSlotTemplateProvider>(context, listen: false);
    debugPrint('working');
    pSlotTemplateProvider.getTemplatesByLevel(0, adminProvider.admin!);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        pSlotTemplateProvider.clearTemplate();
        // debugPrint("tab is animating. from active (getting the index) to inactive(getting the index) ");
      } else {
        //tab is finished animating you get the current index
        //here you can get your index or run some method once.
        Provider.of<PSlotTemplateProvider>(context, listen: false)
            .getTemplatesByLevel(_tabController.index, adminProvider.admin!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Property Levels'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
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
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          PropertySlotTemplateList(
            level: 0,
          ),
          PropertySlotTemplateList(
            level: 1,
          ),
          PropertySlotTemplateList(
            level: 2,
          ),
          PropertySlotTemplateList(
            level: 3,
          ),
          PropertySlotTemplateList(
            level: 4,
          ),
          PropertySlotTemplateList(
            level: 5,
          ),
        ],
      ),
    );
  }

  @override
  dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
