import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monopoly_admin/config/values.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/theme/styles.dart';
import 'package:monopoly_admin/web/admin/pages/dashboard_large_screen.dart';
import 'package:monopoly_admin/web/admin/pages/admin_login.dart';
import 'package:monopoly_admin/web/admin/pages/challenge/question_menu.dart';
import 'package:monopoly_admin/web/admin/pages/reset_password_page.dart';
import 'package:monopoly_admin/web/admin/pages/responsive_dashboard.dart';
import 'package:provider/provider.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({Key? key}) : super(key: key);
// admin
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
          QuestionMenu.route: (context) => const QuestionMenu(),
          ResetPassword.route: (context) => const ResetPassword()
        },
        onGenerateRoute: (settings) {
          if(settings.name != null) {
            final settingsUri = Uri.parse(settings.name!);
//settingsUri.queryParameters is a map of all the query keys and values
            final postID = settingsUri.queryParameters['id'];
            debugPrint('id $postID');
            return MaterialPageRoute(builder: (context) => ResetPassword());
          }
          debugPrint(settings.arguments.toString());
             if(settings.name == ResetPassword.route) {
               debugPrint('working equal name');
             }
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
