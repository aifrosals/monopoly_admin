import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/dashboard_provider.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:monopoly_admin/web/widgets/side_bar/side_bar_list_tile.dart';
import 'package:provider/provider.dart';

class SideBarBoardSlotExpansionTile extends StatelessWidget {
  const SideBarBoardSlotExpansionTile({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
      return Container(
        color: Colors.white,
        child: ExpansionTile(
          title: Text(
            'Board Slots',
            style: TextStyle(color: WebPalette.primary),
          ),
          // trailing: Icon(
          //   CupertinoIcons.square_list_fill,
          //   color: WebPalette.primary,
          // ),
          backgroundColor: Colors.white,

          children: [
            Container(
              color: dashboardProvider.mainWidgetIndex == 5
                  ? WebPalette.primary
                  : Colors.white,
              child: SideBarListTile(
                  title: 'Mange Board Slots',
                  index: 5,
                  icon: CupertinoIcons.list_bullet_below_rectangle),
            ),
            Container(
              color: dashboardProvider.mainWidgetIndex == 6
                  ? WebPalette.primary
                  : Colors.white,
              child: SideBarListTile(
                  title: 'Manage Property Slots',
                  index: 6,
                  icon: CupertinoIcons.photo_fill_on_rectangle_fill),
            ),
          ],
        ),
      );
    });
  }
}
