import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:monopoly_admin/providers/dashboard_provider.dart';
import 'package:monopoly_admin/providers/p_slot_template_provider.dart';
import 'package:monopoly_admin/providers/stats_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/admin_provider.dart';
import 'providers/admin_questions_provider.dart';
import 'web/admin/admin_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AdminProvider>(
      create: (context) => AdminProvider(),
    ),
    ChangeNotifierProvider<DashboardProvider>(
      create: (context) => DashboardProvider(),
    ),
    ChangeNotifierProvider<AdminQuestionProvider>(
      create: (context) => AdminQuestionProvider(),
    ),
    ChangeNotifierProvider<StatsProvider>(
      create: (context) => StatsProvider(),
    ),
    ChangeNotifierProvider<BoardProvider>(
      create: (context) => BoardProvider(),
    ),
    ChangeNotifierProvider<PSlotTemplateProvider>(
      create: (context) => PSlotTemplateProvider(),
    ),

  ], child: const AdminApp()));
}
