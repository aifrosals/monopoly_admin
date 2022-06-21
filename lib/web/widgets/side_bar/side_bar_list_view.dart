import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/web/widgets/side_bar/side_bar_board_slots_expansion_tile.dart';
import 'package:monopoly_admin/web/widgets/side_bar/side_bar_list_tile.dart';

class SideBarListView extends StatelessWidget {
  const SideBarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SideBarListTile(title: 'Stats', index: 0, icon: CupertinoIcons.news),
        SideBarListTile(
            title: 'Challenge', index: 1, icon: CupertinoIcons.bolt_fill),
        SideBarListTile(
            title: 'Users', index: 2, icon: CupertinoIcons.doc_person),
        SideBarBoardSlotExpansionTile(
          index: 3,
        ),
        SideBarListTile(
            title: 'Message', index: 4, icon: CupertinoIcons.envelope),
      ],
    );
  }
}
