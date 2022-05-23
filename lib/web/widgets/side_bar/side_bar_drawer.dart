import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/dashboard_provider.dart';
import 'package:monopoly_admin/theme/web_palette.dart';
import 'package:monopoly_admin/web/widgets/side_bar/side_bar_list_view.dart';
import 'package:provider/provider.dart';

class SideBarDrawer extends StatefulWidget {
  const SideBarDrawer({Key? key}) : super(key: key);

  @override
  State<SideBarDrawer> createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Padding(
          padding: EdgeInsets.only(top: 28.0), child: SideBarListView()),
    );
  }
}
