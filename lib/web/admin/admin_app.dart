import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monopoly_admin/config/values.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/theme/styles.dart';
import 'package:monopoly_admin/web/admin/pages/dashboard_large_screen.dart';
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
          outlinedButtonTheme:
              OutlinedButtonThemeData(style: Styles.outlineButtonStyle),
          elevatedButtonTheme:
              ElevatedButtonThemeData(style: Styles.elevatedButtonStyle),
          textTheme:
              GoogleFonts.sourceSans3TextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[200],
          ),
          primarySwatch: Colors.grey,
        ),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        navigatorKey: Values.adminNavigatorKey,
        initialRoute: '/',
        routes: {
          AdminLogin.route: (context) => const AdminLogin(),
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
