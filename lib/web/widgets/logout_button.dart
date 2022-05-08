import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/web/admin/pages/admin_login.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () async {
            debugPrint('working');
            await adminProvider.logout();
            Navigator.pushNamedAndRemoveUntil(
                context, AdminLogin.route, (route) => false);
          },
          child: const Center(child: Text('Logout'))),
    );
  }
}
