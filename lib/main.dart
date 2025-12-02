import 'package:budget_tracker_app/features/login-feature/presentation/views/login_view.dart';
import 'package:budget_tracker_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const BudgetTrackerApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class BudgetTrackerApp extends StatelessWidget {
  const BudgetTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,

      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginView()),
    );
  }
}
