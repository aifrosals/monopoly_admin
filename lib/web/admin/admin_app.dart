import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/values.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/web/admin/pages/dashbaord_large_screen.dart';
import 'package:monopoly_admin/web/admin/pages/admin_login.dart';
import 'package:monopoly_admin/web/admin/pages/challenge/question_menu.dart';
import 'package:monopoly_admin/web/admin/pages/responsive_dashboard.dart';
import 'package:provider/provider.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Monopoly Admin Portal',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[200],
          ),
          primarySwatch: Colors.grey,
        ),
        navigatorKey: Values.adminNavigatorKey,
        initialRoute: '/',
        routes: {
          ResponsiveDashboard.route: (context) => const ResponsiveDashboard(),
          QuestionMenu.route: (context) => const QuestionMenu()
        },
        home: Consumer<AdminProvider>(builder: (context, adminProvider, child) {
          if (adminProvider.sessionLoading) {
            return const Scaffold(
              body: LinearProgressIndicator(),
            );
          } else if (adminProvider.admin != null) {
            return const ResponsiveDashboard();
          } else {
            return const AdminLogin();
          }
        }));
  }
}
